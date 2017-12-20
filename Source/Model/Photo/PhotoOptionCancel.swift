import UIKit

struct PhotoOptionCancel:PhotoOptionProtocol
{
    let icon:UIImage = #imageLiteral(resourceName: "assetPhotoOptionCancel")
    let router:((ControllerPhoto) -> () -> ()) = ControllerPhoto.optionCancel
}
