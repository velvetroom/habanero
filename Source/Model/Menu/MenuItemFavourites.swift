import UIKit

struct MenuItemFavourites:MenuItemGenericProtocol
{
    typealias A = ArchHome
    
    let order:Menu.Order = Menu.Order.favourite
    let icon:UIImage = #imageLiteral(resourceName: "assetMenuFavourites")
}
