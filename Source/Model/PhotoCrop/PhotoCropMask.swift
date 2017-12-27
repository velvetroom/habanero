import UIKit

struct PhotoCropMask
{
    var imageRect:CGRect
    var contentOffset:CGPoint
    var screenWidth:CGFloat
    var zoomScale:CGFloat
    
    init()
    {
        self.imageRect = CGRect.zero
        self.contentOffset = CGPoint.zero
        self.screenWidth = 0
        self.zoomScale = 0
    }
}
