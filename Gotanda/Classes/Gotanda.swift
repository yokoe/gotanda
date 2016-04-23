import Cocoa

public class Gotanda {
    private var bitmapContext: CGContextRef?
    
    public convenience init(width: CGFloat, height: CGFloat, backgroundColor: CGColor = NSColor.clearColor().CGColor) {
        self.init(width: UInt(width), height: UInt(height), backgroundColor: backgroundColor)
    }
    
    public init(width: UInt, height: UInt, backgroundColor: CGColor = NSColor.clearColor().CGColor) {
        let bitsPerComponent = Int(8)
        let bytesPerRow = 4 * width
        let colorSpace = CGColorSpaceCreateDeviceRGB()
        let bitmapInfo = CGBitmapInfo(rawValue: CGImageAlphaInfo.PremultipliedLast.rawValue).rawValue
        
        bitmapContext = CGBitmapContextCreate(nil, Int(width), Int(height), bitsPerComponent, Int(bytesPerRow), colorSpace, bitmapInfo)
        
        if let context = bitmapContext {
            CGContextSetFillColorWithColor(context, backgroundColor)
            CGContextFillRect(context, CGRectMake(0, 0, CGFloat(width), CGFloat(height)))
        } else {
            fatalError("Failed to create bitmap context.")
        }
    }
    
    public func draw(contents: ((context: CGContextRef) -> ())) -> Gotanda {
        guard let context = bitmapContext else {
            fatalError("bitmapContext is empty.")
        }
        
        contents(context: context)
        
        return self
    }
    
    public var imageRep: NSBitmapImageRep? {
        guard let context = bitmapContext else {
            fatalError("bitmapContext is empty.")
        }
        
        if let newImageRef = CGBitmapContextCreateImage(context) {
            return NSBitmapImageRep(CGImage: newImageRef)
        } else {
            return nil
        }
    }
    
    public var pngData: NSData? {
        guard let imageRep = imageRep else {
            print("No image rep.")
            return nil
        }
        
        return imageRep.representationUsingType(.NSPNGFileType, properties: [:])
    }
    
    public var nsImage: NSImage? {
        guard let pngData = pngData else {
            print("No pngData.")
            return nil
        }
        
        return NSImage(data: pngData)
    }
}
