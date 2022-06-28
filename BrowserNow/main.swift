//
//  Main.swift
//  BrowserNow
//
//  Created by Rob Anderson on 28/06/2022.
//

import Cocoa

let app = NSApplication.shared
let delegate = AppDelegate()
app.delegate = delegate

_ = NSApplicationMain(CommandLine.argc, CommandLine.unsafeArgv)
