import UIKit

final class PhotoCrop:Model<ArchPhotoCrop>
{
    var image:UIImage?
    var completion:((UIImage?) -> ())?
    
    private var orientationRotationMap:[UIImageOrientation : CGFloat]
    {
        get
        {
            let map:[UIImageOrientation : CGFloat] = [
                UIImageOrientation.down : PhotoCrop.Constants.rotateUpsidedown,
                UIImageOrientation.downMirrored : PhotoCrop.Constants.rotateUpsidedown,
                UIImageOrientation.right : PhotoCrop.Constants.rotateRight,
                UIImageOrientation.rightMirrored : PhotoCrop.Constants.rotateRight,
                UIImageOrientation.left : PhotoCrop.Constants.rotateLeft,
                UIImageOrientation.leftMirrored : PhotoCrop.Constants.rotateLeft ]
            
            return map
        }
    }
    
    //MARK: private
    
    private func asyncRenderImage(image:UIImage)
    {
        guard
        
            let rotation:CGFloat = self.orientationRotationMap[image.imageOrientation],
            let rotatedImage:UIImage = self.rotateImage(
                image:image,
                rotation:rotation)
        
        else
        {
            self.image = image
            
            return
        }
        
        self.image = rotatedImage
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
