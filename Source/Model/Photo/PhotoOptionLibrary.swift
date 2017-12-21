import UIKit

struct PhotoOptionLibrary:PhotoOptionProtocol
{
    let icon:UIImage = #imageLiteral(resourceName: "assetPhotoOptionCancel")
    let router:((ControllerPhoto) -> () -> ()) = ControllerPhoto.optionCancel
}
