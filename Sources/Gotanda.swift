#if os(OSX)
    import Cocoa
#elseif os(iOS)
    import UIKit
#endif

open class Gotanda {
    fileprivate var bitmapContext: CGContext?
    
    #if os(OSX)
    public convenience init(size: CGSize, backgroundColor: CGColor = NSColor.clear.cgColor) {
        self.init(width: UInt(size.width), height: UInt(size.height), backgroundColor: backgroundColor)
    }
    #elseif os(iOS)
    public convenience init(size: CGSize, backgroundColor: CGColor = UIColor.clear.cgColor) {
        self.init(width: UInt(size.width), height: UInt(size.height), backgroundColor: backgroundColor)
    }
    #endif
    
    #if os(OSX)
    public init(width: UInt, height: UInt, backgroundColor: CGColor = NSColor.clear.cgColor) {
        setup(width: width, height: height, backgroundColor: backgroundColor)
    }
    #elseif os(iOS)
    public init(width: UInt, height: UInt, backgroundColor: CGColor = UIColor.clear.cgColor) {
        setup(width: width, height: height, backgroundColor: backgroundColor)
    }
    #endif
    private func setup(width: UInt, height: UInt, backgroundColor: CGColor) {
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
    
    #if os(OSX)
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
    #endif
    
    #if os(iOS)
    open var uiImage: UIImage? {
        guard let img = bitmapContext?.makeImage() else { return nil }
        return UIImage(cgImage: img)
    }
    #endif
}