import UIKit

struct MenuItemOptions:MenuItemGenericProtocol
{
    typealias A = ArchOptions
    let order:Menu.Order = Menu.Order.new
    let icon:UIImage = #imageLiteral(resourceName: "assetMenuNew")
}
