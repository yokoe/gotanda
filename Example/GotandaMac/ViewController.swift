//
//  ViewController.swift
//  GotandaMac
//
//  Created by Sota Yokoe on 2016/10/09.
//  Copyright © 2016年 CocoaPods. All rights reserved.
//

import Cocoa
import Gotanda

class ViewController: NSViewController {
    @IBOutlet weak var imageView: NSImageView!

    override func viewDidLoad() {
        super.viewDidLoad()

        imageView.image = Gotanda(width: 180, height: 180, backgroundColor: NSColor.red.cgColor).nsImage
    }

    override var representedObject: Any? {
        didSet {
        // Update the view, if already loaded.
        }
    }


}

