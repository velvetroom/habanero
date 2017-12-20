import UIKit

protocol PhotoOptionProtocol
{
    var icon:UIImage { get }
    var router:((ControllerPhoto) -> () -> ()) { get }
}
