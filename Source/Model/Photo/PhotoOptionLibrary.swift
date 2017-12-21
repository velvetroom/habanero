import UIKit

struct PhotoOptionLibrary:PhotoOptionProtocol
{
    let icon:UIImage = #imageLiteral(resourceName: "assetPhotoOptionLibrary")
    let router:((ControllerPhoto) -> () -> ()) = ControllerPhoto.optionLibrary
}
