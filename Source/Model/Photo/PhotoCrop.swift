import UIKit

final class PhotoCrop:Model<ArchPhotoCrop>
{
    var image:UIImage?
    var completion:((UIImage?) -> ())?
    
    private var orientationRotation:[UIImageOrientation:PhotoRotation]
    {
        get
        {
            let map:[UIImageOrientation:PhotoRotation] = [
                UIImageOrientation.down : PhotoRotation.upsidedown,
                UIImageOrientation.downMirrored : PhotoRotation.upsidedown,
                UIImageOrientation.right : PhotoRotation.right,
                UIImageOrientation.rightMirrored : PhotoRotation.right,
                UIImageOrientation.left : PhotoRotation.left,
                UIImageOrientation.leftMirrored : PhotoRotation.left]
            
            return map
        }
    }
    
    //MARK: private
    
    private func asyncNormalizeOrientation(
        image:UIImage,
        completion:@escaping((UIImage) -> ()))
    {
        guard
        
            let rotation:PhotoRotation = self.orientationRotation[image.imageOrientation],
            let normalizedImage:UIImage = self.rotateImage(
                image:image,
                rotation:rotation)
        
        else
        {
            self.imageNormalized(
                image:image,
                completion:completion)
            
            return
        }
        
        self.imageNormalized(
            image:normalizedImage,
            completion:completion)
    }
    
    private func imageNormalized(
        image:UIImage,
        completion:@escaping((UIImage) -> ()))
    {
        DispatchQueue.main.async
        {
            completion(image)
        }
    }
    
    //MARK: internal
    
    func normalizeOrientation(
        image:UIImage,
        completion:@escaping((UIImage) -> ()))
    {
        DispatchQueue.global(qos:DispatchQoS.QoSClass.background).async
        { [weak self] in
            
            self?.asyncNormalizeOrientation(
                image:image,
                completion:completion)
        }
    }
}
