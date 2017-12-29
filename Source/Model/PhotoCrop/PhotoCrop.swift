import UIKit

final class PhotoCrop:Model<ArchPhotoCrop>
{
    var image:UIImage?
    var completion:((UIImage?) -> ())?
    
    //MARK: private
    
    private func asyncRenderImage(image:UIImage)
    {
        switch image.imageOrientation
        {
        case UIImageOrientation.down:
            
            print("down")
            
        case UIImageOrientation.up:
            
                print("up")
            
        case UIImageOrientation.left:
            
            print("left")
            
        case UIImageOrientation.right:
            
            print("right")
            
        default:
            
            print("other")
        }
        
        
        
        UIGraphicsBeginImageContext(image.size)
        
        guard
            
            let cgImage:CGImage = image.cgImage
        
        else
        {
            return
        }
        
        let imageWidth:CGFloat = CGFloat(cgImage.width)
        let imageHeight:CGFloat = CGFloat(cgImage.height)
        
        let imageSize:CGSize = CGSize(
            width:imageWidth,
            height:imageHeight)
        
        let drawingRect:CGRect = CGRect(
            x:0,
            y:0,
            width:imageWidth,
            height:imageHeight)
        
        UIGraphicsBeginImageContext(imageSize)
        
        guard
            
            let context:CGContext = UIGraphicsGetCurrentContext()
            
        else
        {
            return
        }
        
        context.translateBy(
            x:0,
            y:imageHeight)
        
        context.scaleBy(
            x:1,
            y:-1)
        
        context.draw(
            cgImage,
            in:drawingRect)
        
        guard
            
            let newCgImage:CGImage = context.makeImage()
        
        else
        {
            UIGraphicsEndImageContext()
            
            return
        }
        
        UIGraphicsEndImageContext()
        
        let renderedImage:UIImage = UIImage(cgImage:newCgImage)
        
        self.image = renderedImage
    }
    
    //MARK: internal
    
    func renderImage(image:UIImage)
    {
        DispatchQueue.global(qos:DispatchQoS.QoSClass.background).async
        { [weak self] in
            
            self?.asyncRenderImage(image:image)
        }
    }
}
