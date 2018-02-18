import UIKit

struct MenuItemCalendar:MenuItemGenericProtocol
{
    typealias A = ArchCalendar
    let order:Menu.Order = Menu.Order.options
    let icon:UIImage = #imageLiteral(resourceName: "assetMenuOptions")
}
