import UIKit

struct MenuItemNew:MenuItemGenericProtocol
{
    typealias A = ArchNew
    
    let order:Menu.Order = Menu.Order.n
    let icon:UIImage = #imageLiteral(resourceName: "assetMenuHome")
}
