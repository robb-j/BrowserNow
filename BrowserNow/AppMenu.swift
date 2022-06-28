//
//  MainMenu.swift
//  BrowserNow
//
//  Created by Rob Anderson on 28/06/2022.
//

import Foundation
import AppKit

protocol AppMenuDelegate {
}

let BROWSER_TAG = 9

class AppMenu: NSObject {
    
    let app: BrowserNowApp
    var delegate: AppMenuDelegate?
    var statusItem: NSStatusItem!
    
    @IBOutlet var menu: NSMenu!
    
    init(app: BrowserNowApp, delegate: AppMenuDelegate?) {
        self.app = app
        self.delegate = delegate
        self.statusItem = NSStatusBar.system.statusItem(withLength: NSStatusItem.variableLength)
        
        super.init()
        Bundle.main.loadNibNamed("AppMenu", owner: self, topLevelObjects: nil)
        
        statusItem.menu = menu
        statusItem.button?.font = NSFont.monospacedDigitSystemFont(ofSize: NSFont.systemFontSize, weight: .regular)
        statusItem.button?.image = NSImage(named: "StatusBarImage")
        
        render()
    }
    
    func render() {
        let current = app.getCurrentBrowser()
        
        for item in menu.items {
            if item.tag != BROWSER_TAG { continue }
            menu.removeItem(item)
        }
        for browser in app.getBrowsers() {
            let isCurrent = browser.url == current.url
            let item = NSMenuItem(title: browser.name, action: #selector(pickBrowser(_:)), keyEquivalent: "")
            item.target = isCurrent ? nil : self
            item.tag = BROWSER_TAG
            item.state = isCurrent ? .on : .off
            item.representedObject = browser
            
            menu.insertItem(item, at: 0)
        }
    }
    
    @IBAction func quitApp(_ sender: Any) {
        NSApplication.shared.terminate(self)
    }
    
    @objc func pickBrowser(_ sender: NSMenuItem) {
        if let browser = sender.representedObject as? Browser {
            NSWorkspace.shared.setDefaultApplication(at: browser.url, toOpenURLsWithScheme: "http")
        }
    }
}

extension AppMenu: NSMenuDelegate {
    func menuWillOpen(_ menu: NSMenu) {
        render()
    }
}
