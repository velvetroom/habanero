import UIKit

extension PhotoRotation
{
    var radians:CGFloat
    {
        get
        {
            guard
            
                let degrees:CGFloat = PhotoRotation.degreesMap[self]
            
            else
            {
                return 0
            }
            
            return degrees
        }
    }
    
    private static var degreesMap:[PhotoRotation:CGFloat]
    {
        get
        {
            let map:[PhotoRotation:CGFloat] = [
                PhotoRotation.right : PhotoRotation.Constants.degreesRight,
                PhotoRotation.left : PhotoRotation.Constants.degreesLeft,
                PhotoRotation.upsidedown : PhotoRotation.Constants.degreesUpsidedown]
            
            return map
        }
    }
    
    private static var rotationSizeRouter:[PhotoRotation : ((CGImage) -> (CGSize))]
    {
        get
        {
            let map:[PhotoRotation : ((CGImage) -> (CGSize))] = [
                PhotoRotation.right : PhotoRotation.swapSize,
                PhotoRotation.left : PhotoRotation.swapSize,
                PhotoRotation.left : PhotoRotation.sameSize]
            
            return map
        }
    }
    
    //MARK: private
    
    private static func swapSize(image:CGImage) -> CGSize
    {
        let width:CGFloat = CGFloat(image.width)
        let height:CGFloat = CGFloat(image.height)
        
        let size:CGSize = CGSize(
            width:height,
            height:width)
        
        return size
    }
    
    private static func sameSize(image:CGImage) -> CGSize
    {
        let width:CGFloat = CGFloat(image.width)
        let height:CGFloat = CGFloat(image.height)
        
        let size:CGSize = CGSize(
            width:width,
            height:height)
        
        return size
    }
    
    //MARK: internal
    
    func rotationSizeFor(image:CGImage) -> CGSize?
    {
        guard
        
            let router:((CGImage) -> (CGSize)) = PhotoRotation.rotationSizeRouter[self]
        
        else
        {
            return nil
        }
        
        let size:CGSize = router(image)
        
        return size
    }
}
