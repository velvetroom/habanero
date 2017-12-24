import UIKit

final class PhotoCrop:Model<ArchPhotoCrop>
{
    var image:UIImage?
    var scaledWidth:CGFloat
    var scaledHeight:CGFloat
    
    required init()
    {
        self.scaledWidth = 0
        self.scaledHeight = 0
        
        super.init()
    }
}
