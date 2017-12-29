import UIKit

extension PhotoCrop
{
    private var context:CGContext?
    {
        get
        {
            guard
                
                let newSize:CGSize = self.rotatedSize
                
            else
            {
                return nil
            }
            
            UIGraphicsBeginImageContext(newSize)
            
            let context:CGContext? = UIGraphicsGetCurrentContext()
            
            return context
        }
    }
    
    private var rotatedSize:CGSize?
    {
        get
        {
            guard
                
                let image:CGImage = self.image?.cgImage
                
            else
            {
                return nil
            }
            
            let height:CGFloat = CGFloat(image.width)
            let width:CGFloat = CGFloat(image.height)
            
            let size:CGSize = CGSize(
                width:width,
                height:height)
            
            return size
        }
    }
    
    private var drawingRect:CGRect?
    {
        get
        {
            guard
                
                let image:CGImage = self.image?.cgImage
                
            else
            {
                return nil
            }
            
            let width:CGFloat = CGFloat(image.width)
            let height:CGFloat = CGFloat(image.height)
            
            let rect:CGRect = CGRect(
                x:0,
                y:0,
                width:width,
                height:height)
            
            return rect
        }
    }
    
    //MARK: private
    
    private func asyncRotateImageRight(completion:@escaping(() -> ()))
    {
        guard
        
            let originalImage:UIImage = self.image,
            let newImage:UIImage = self.rotateImage(
                image:originalImage,
                rotation:PhotoCrop.Constants.rotateRight)
        
        else
        {
            return
        }
        
        self.image = newImage
        
        DispatchQueue.main.async
        {
            completion()
        }
    }
    
    private func rotateImage(
        image:CGImage,
        context:CGContext,
        newSize:CGSize,
        drawingRect:CGRect,
        rotation:CGFloat) -> CGImage?
    {
        let width_2:CGFloat = newSize.width / 2.0
        let height_2:CGFloat = newSize.height / 2.0
        
        context.translateBy(
            x:width_2,
            y:height_2)
        
        context.rotate(by:rotation)
        
        context.translateBy(
            x:-drawingRect.midX,
            y:drawingRect.midY)
        
        context.scaleBy(
            x:1,
            y:-1)
        
        context.draw(
            image,
            in:drawingRect)
        
        let newImage:CGImage? = context.makeImage()
        
        return newImage
    }
    
    //MARK: internal
    
    func rotateImage(
        image:UIImage,
        rotation:CGFloat) -> UIImage?
    {
        guard
            
            let image:CGImage = image.cgImage,
            let newSize:CGSize = self.rotatedSize,
            let drawingRect:CGRect = self.drawingRect,
            let context:CGContext = self.context,
            let imageRotated:CGImage = self.rotateImage(
                image:image,
                context:context,
                newSize:newSize,
                drawingRect:drawingRect,
                rotation:rotation)
            
        else
        {
            UIGraphicsEndImageContext()
            
            return nil
        }
        
        UIGraphicsEndImageContext()
        
        let newImage:UIImage = UIImage(cgImage:imageRotated)
        
        return newImage
    }
    
    func rotateImageRight(completion:@escaping(() -> ()))
    {
        DispatchQueue.global(qos:DispatchQoS.QoSClass.background).async
        { [weak self] in
            
            self?.asyncRotateImageRight(completion:completion)
        }
    }
}
