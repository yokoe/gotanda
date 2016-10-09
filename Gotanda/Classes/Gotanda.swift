import Cocoa

open class Gotanda {
    fileprivate var bitmapContext: CGContext?
    
    public convenience init(size: CGSize, backgroundColor: CGColor = NSColor.clear.cgColor) {
        self.init(width: UInt(size.width), height: UInt(size.height), backgroundColor: backgroundColor)
    }
    
    public init(width: UInt, height: UInt, backgroundColor: CGColor = NSColor.clear.cgColor) {
        let bitsPerComponent = Int(8)
        let bytesPerRow = 4 * width
        let colorSpace = CGColorSpaceCreateDeviceRGB()
        let bitmapInfo = CGBitmapInfo(rawValue: CGImageAlphaInfo.premultipliedLast.rawValue).rawValue
        
        bitmapContext = CGContext(data: nil, width: Int(width), height: Int(height), bitsPerComponent: bitsPerComponent, bytesPerRow: Int(bytesPerRow), space: colorSpace, bitmapInfo: bitmapInfo)
        
        if let context = bitmapContext {
            context.setFillColor(backgroundColor)
            context.fill(CGRect(x: 0, y: 0, width: CGFloat(width), height: CGFloat(height)))
        } else {
            fatalError("Failed to create bitmap context.")
        }
    }
    
    open func draw(_ contents: ((_ context: CGContext) -> ())) -> Gotanda {
        guard let context = bitmapContext else {
            fatalError("bitmapContext is empty.")
        }
        
        contents(context)
        
        return self
    }
    
    open var imageRep: NSBitmapImageRep? {
        guard let context = bitmapContext else {
            fatalError("bitmapContext is empty.")
        }
        
        if let newImageRef = context.makeImage() {
            return NSBitmapImageRep(cgImage: newImageRef)
        } else {
            return nil
        }
    }
    
    open var pngData: Data? {
        guard let imageRep = imageRep else {
            print("No image rep.")
            return nil
        }
        
        return imageRep.representation(using: .PNG, properties: [:])
    }
    
    open var nsImage: NSImage? {
        guard let pngData = pngData else {
            print("No pngData.")
            return nil
        }
        
        return NSImage(data: pngData)
    }
}
