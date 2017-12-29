import UIKit

final class PhotoCrop:Model<ArchPhotoCrop>
{
    var image:UIImage?
    var completion:((UIImage?) -> ())?
    
    private var orientationRouter:[UIImageOrientation : ((UIImage) -> (UIImage?))]
    {
        get
        {
            let map:[UIImageOrientation : ((UIImage) -> (UIImage?))] = [
                UIImageOrientation.down : self.rotateUpsidedown,
                UIImageOrientation.downMirrored : self.rotateUpsidedown,
                UIImageOrientation.right : self.rotateRight,
                UIImageOrientation.rightMirrored : self.rotateRight,
                UIImageOrientation.left : self.rotateLeft,
                UIImageOrientation.leftMirrored : self.rotateLeft ]
            
            return map
        }
    }
    
    //MARK: private
    
    private func asyncRenderImage(image:UIImage)
    {
        guard
        
            let router:((UIImage) -> (UIImage?)) = self.orientationRouter[image.imageOrientation],
            let rotatedImage:UIImage = router(image)
        
        else
        {
            self.image = image
            
            return
        }
        
        self.image = rotatedImage
    }
    
    private func rotateRight(image:UIImage) -> UIImage?
    {
        guard
            
            let cgImage:CGImage = image.cgImage
        
        else
        {
            return nil
        }
        
        let width:CGFloat = CGFloat(cgImage.width)
        let height:CGFloat = CGFloat(cgImage.height)
        
        let newSize:CGSize = CGSize(
            width:height,
            height:width)
        
        let drawingRect:CGRect = CGRect(
            x:0,
            y:0,
            width:width,
            height:height)
        
        let rotatedImage:UIImage? = self.rotateImage(
            image:image,
            rotation:PhotoCrop.Constants.rotateRight,
            newSize:newSize,
            drawingRect:drawingRect)
        
        return rotatedImage
    }
    
    private func rotateLeft(image:UIImage) -> UIImage?
    {
        guard
            
            let cgImage:CGImage = image.cgImage
            
        else
        {
            return nil
        }
        
        let width:CGFloat = CGFloat(cgImage.width)
        let height:CGFloat = CGFloat(cgImage.height)
        
        let newSize:CGSize = CGSize(
            width:height,
            height:width)
        
        let drawingRect:CGRect = CGRect(
            x:0,
            y:0,
            width:width,
            height:height)
        
        let rotatedImage:UIImage? = self.rotateImage(
            image:image,
            rotation:PhotoCrop.Constants.rotateLeft,
            newSize:newSize,
            drawingRect:drawingRect)
        
        return rotatedImage
    }
    
    private func rotateUpsidedown(image:UIImage) -> UIImage?
    {
        guard
            
            let cgImage:CGImage = image.cgImage
            
        else
        {
            return nil
        }
        
        let width:CGFloat = CGFloat(cgImage.width)
        let height:CGFloat = CGFloat(cgImage.height)
        
        let newSize:CGSize = CGSize(
            width:width,
            height:height)
        
        let drawingRect:CGRect = CGRect(
            x:0,
            y:0,
            width:width,
            height:height)
        
        let rotatedImage:UIImage? = self.rotateImage(
            image:image,
            rotation:PhotoCrop.Constants.rotateUpsidedown,
            newSize:newSize,
            drawingRect:drawingRect)
        
        return rotatedImage
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
