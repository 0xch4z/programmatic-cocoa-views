//
//  ViewController.swift
//  Programmatic Views
//
//  Created by Charles Kenney on 10/15/17.
//  Copyright © 2017 Charles Kenney. All rights reserved.
//

import Foundation
import Cocoa

class ViewController: NSViewController {
    
    let label: NSTextField = {
        let label = NSTextField(string: "programmatic windows")
        label.drawsBackground = false
        label.isBordered = false
        label.alignment = .center
        label.font = NSFont(name: "Helvetica Neue Thin", size: 30)
        label.isEditable = false
        label.isSelectable = false
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override func loadView() {
        // init view
        self.view = NSView()
    }
    
    func addViews() {
        view.addSubview(label)
    }
    
    func setupLabel() {
        // add constraints to label
        label.heightAnchor.constraint(equalToConstant: 40).isActive = true
        label.widthAnchor.constraint(equalToConstant: 400).isActive = true
        label.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        label.centerYAnchor.constraint(equalTo: self.view.centerYAnchor).isActive = true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // setup views
        addViews()
        setupLabel()
    }
    
}
