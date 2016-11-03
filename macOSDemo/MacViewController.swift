import Cocoa
import Gotanda

class MacViewController: NSViewController {
    @IBOutlet weak var imageView: NSImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        imageView.image = Gotanda(width: 200, height: 200, backgroundColor: NSColor.yellow.cgColor).draw({ (context) in
            context.setLineWidth(2)
            context.setStrokeColor(NSColor.blue.cgColor)
            context.move(to: CGPoint(x: 50, y: 50))
            context.addLine(to: CGPoint(x: 150, y: 150))
            context.strokePath()
            
            if let arrowImage = NSImage(named: "Arrow") {
                var proposedRect = CGRect(origin: CGPoint(), size: arrowImage.size)
                
                if let cgImage = arrowImage.cgImage(forProposedRect: &proposedRect, context: nil, hints: nil) {
                    context.draw(cgImage, in: CGRect(origin: CGPoint(), size: CGSize(width: 50, height: 50)))
                }
            }
            
        }).nsImage
    }

}

