import UIKit

struct PhotoOptionCamera:PhotoOptionProtocol
{
    let icon:UIImage = #imageLiteral(resourceName: "assetPhotoOptionCamera")
    let router:((ControllerPhoto) -> () -> ()) = ControllerPhoto.optionCamera
}
