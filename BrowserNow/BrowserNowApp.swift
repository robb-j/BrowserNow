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
        return NSWorkspace.shared.icon(forFile: browser.url.path)
    }
}
