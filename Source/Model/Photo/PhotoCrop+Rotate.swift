import UIKit

extension PhotoCrop
{
    //MARK: private
    
    private func asyncRotateImageRight(completion:@escaping(() -> ()))
    {
        guard
        
            let originalImage:UIImage = self.image,
            let newImage:UIImage = self.rotateImage(
                image:originalImage,
                rotation:PhotoRotation.right)
        
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
    
    private func drawingRectFor(image:CGImage) -> CGRect
    {
        let width:CGFloat = CGFloat(image.width)
        let height:CGFloat = CGFloat(image.height)
        
        let drawingRect:CGRect = CGRect(
            x:0,
            y:0,
            width:width,
            height:height)
        
        return drawingRect
    }
    
    private func rotateImage(
        image:CGImage,
        rotation:PhotoRotation,
        context:CGContext,
        newSize:CGSize) -> CGImage?
    {
        let drawingRect:CGRect = self.drawingRectFor(image:image)
        let width_2:CGFloat = newSize.width / 2.0
        let height_2:CGFloat = newSize.height / 2.0
        
        context.translateBy(
            x:width_2,
            y:height_2)
        
        context.rotate(by:rotation.radians)
        
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
        rotation:PhotoRotation) -> UIImage?
    {
        guard
            
            let cgImage:CGImage = image.cgImage,
            let newSize:CGSize = rotation.rotationSizeFor(image:cgImage)
        
        else
        {
            return nil
        }
        
        UIGraphicsBeginImageContext(newSize)
        
        guard
            
            let context:CGContext = UIGraphicsGetCurrentContext(),
            let imageRotated:CGImage = self.rotateImage(
                image:cgImage,
                rotation:rotation,
                context:context,
                newSize:newSize)
        
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
