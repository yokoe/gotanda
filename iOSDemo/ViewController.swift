//
//  ViewController.swift
//  iOSDemo
//
//  Created by Sota Yokoe on 2016/11/03.
//
//

import UIKit
import Gotanda

class ViewController: UIViewController {
    @IBOutlet weak var imageView: UIImageView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        imageView.image = Gotanda(width: 200, height: 200, backgroundColor: UIColor.yellow.cgColor).draw({ (context) in
            context.setLineWidth(2)
            context.setStrokeColor(UIColor.blue.cgColor)
            context.move(to: CGPoint(x: 50, y: 50))
            context.addLine(to: CGPoint(x: 150, y: 150))
            context.strokePath()
            
            if let arrowImage = UIImage(named: "Arrow") {
                context.draw(arrowImage.cgImage!, in: CGRect(origin: CGPoint(), size: CGSize(width: 50, height: 50)))
            }
            
        }).uiImage
    }

}

