//
//  AppDelegate.swift
//  Programmatic Views
//
//  Created by Charles Kenney on 10/15/17.
//  Copyright © 2017 Charles Kenney. All rights reserved.
//

import Cocoa

class AppDelegate: NSObject, NSApplicationDelegate, NSWindowDelegate {
    
    let controller = ViewController()
    
    let window: NSWindow = {
        // create window instance
        let content = NSRect(x: 0, y: 0,
                             width: NSScreen.main!.frame.width / 2,
                             height: NSScreen.main!.frame.height / 2)
        let mask: [NSWindow.StyleMask] = [.titled, .resizable, .closable,]
        let window = NSWindow(contentRect: content,
                              styleMask: .titled,
                              backing: NSWindow.BackingStoreType.buffered,
                              defer: false)
        // style window
        window.styleMask = [.titled, .resizable, .closable, .miniaturizable]
        window.title = "Main Window"
        window.isOpaque = false
        window.hidesOnDeactivate = true
        window.isMovableByWindowBackground = true
        window.backgroundColor = NSColor(calibratedHue: 0, saturation: 0, brightness: 1, alpha: 1)
        window.backgroundColor = NSColor(red: 0, green: 0, blue: 0, alpha: 0.85)
        window.titlebarAppearsTransparent = true
        window.appearance = NSAppearance(named: .vibrantDark)
        // make key
        window.makeKeyAndOrderFront(nil)
        return window
    }()
    
    func applicationDidFinishLaunching(_ aNotification: Notification) {
        window.delegate = self
        // make controller a subview to window
        controller.view.frame = NSRect(x: 0, y: 0, width: window.frame.size.width, height: window.frame.size.height)
        controller.view.wantsLayer = true
        window.contentView?.addSubview(controller.view)
    }
    
    func windowWillResize(_ sender: NSWindow, to frameSize: NSSize) -> NSSize {
        // resizes view on window resize
        controller.view.frame = NSRect(x: 0, y: 0, width: frameSize.width, height: frameSize.height)
        return frameSize
    }

    func applicationWillTerminate(_ aNotification: Notification) { }
}

