import UIKit

struct MenuItemHome:MenuItemProtocol
{
    let order:Menu.Order = Menu.Order.home
    let icon:UIImage = UIImage()
    let controllerType:UIViewController.Type = ControllerHome.self
}
