//
//  AppDelegate.swift
//  BrowserNow
//
//  Created by Rob Anderson on 28/06/2022.
//

import Cocoa

class AppDelegate: NSObject, NSApplicationDelegate {
    private var menu: AppMenu?
    private let app = BrowserNowApp()
    
    func applicationDidFinishLaunching(_ notification: Notification) {
        menu = AppMenu(app: app, delegate: self)
    }
}

extension AppDelegate: AppMenuDelegate {
    // ...
}
