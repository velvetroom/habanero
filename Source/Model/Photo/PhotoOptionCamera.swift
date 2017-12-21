import UIKit

struct PhotoOptionCamera:PhotoOptionProtocol
{
    let icon:UIImage = #imageLiteral(resourceName: "assetPhotoOptionCancel")
    let router:((ControllerPhoto) -> () -> ()) = ControllerPhoto.optionCamera
}
