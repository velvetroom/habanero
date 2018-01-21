import UIKit

struct MenuItemFavourites:MenuItemGenericProtocol
{
    typealias A = ArchFavourites
    
    let order:Menu.Order = Menu.Order.favourite
    let icon:UIImage = #imageLiteral(resourceName: "assetMenuFavourites")
}
