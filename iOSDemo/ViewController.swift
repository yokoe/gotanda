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
    @IBOutlet weak var anotherView: UIView!
    
    private let anotherLayer = CALayer()

    override func viewDidLoad() {
        super.viewDidLoad()
        
//        let gotanda = Gotanda(width: 200, height: 200, backgroundColor: UIColor.yellow.cgColor).draw({ (context) in
//            context.setLineWidth(2)
//            context.setStrokeColor(UIColor.blue.cgColor)
//            context.move(to: CGPoint(x: 50, y: 50))
//            context.addLine(to: CGPoint(x: 150, y: 150))
//            context.strokePath()
//            
//            if let arrowImage = UIImage(named: "Arrow") {
//                context.draw(arrowImage.cgImage!, in: CGRect(origin: CGPoint(), size: CGSize(width: 50, height: 50)))
//            }
//            
//        })
        
        let gotanda = Gotanda(width: 200, height: 200, backgroundColor: UIColor.yellow.cgColor).draw(#imageLiteral(resourceName: "NightSky").cgImage!, mode: .centerFit)
        
        imageView.image = gotanda.uiImage
        
        anotherLayer.contents = gotanda.cgImage
        anotherView.layer.addSublayer(anotherLayer)
    }
    
    override func viewDidLayoutSubviews() {
        anotherLayer.frame = anotherView.layer.bounds
    }

}

