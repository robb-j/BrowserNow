//
//  BrowserNowApp.swift
//  BrowserNow
//
//  Created by Rob Anderson on 28/06/2022.
//

import SwiftUI

struct Browser {
    let url: URL
    let name: String
}

let commonUrl = URL(string: "https://duck.com")!
let fallbackBrowser = URL(string: "file:///Applications/Safari.app/")!

struct BrowserNowApp {
    private func makeBrowser(fromUrl url: URL) -> Browser {
        let filename = url.pathComponents.last!
        let name = filename.replacingOccurrences(of: ".app", with: "")
        return Browser(url: url, name: name)
    }
    
    func getBrowsers() -> [Browser] {
        return NSWorkspace.shared
            .urlsForApplications(toOpen: commonUrl)
            .map { url in
                return makeBrowser(fromUrl: url)
            }
            .sorted { a, b in
                return b.name > a.name
            }
    }
    
    func getCurrentBrowser() -> Browser {
        let url = NSWorkspace.shared.urlForApplication(toOpen: commonUrl) ?? fallbackBrowser
        return makeBrowser(fromUrl: url)
    }
    
    func getBrowserIcon(_ browser: Browser) -> NSImage? {
        let lowercaseName = browser.name.lowercased()
        
        // TODO: can this be done better with pattern matching?
        if (lowercaseName.contains("brave")) {
            return NSImage(named: "BraveIcon")
        }
        if (lowercaseName.contains("chrome")) {
            return NSImage(named: "ChromeIcon")
        }
        if (lowercaseName.contains("edge")) {
            return NSImage(named: "EdgeIcon")
        }
        if (lowercaseName.contains("firefox")) {
            return NSImage(named: "FirefoxIcon")
        }
        if (lowercaseName.contains("opera")) {
            return NSImage(named: "OperaIcon")
        }
        if (lowercaseName.contains("safari")) {
            return NSImage(named: "SafariIcon")
        }
        
        return nil
    }
}
