import Foundation

struct CookItemFavouriteOff:CookItemFavouriteProtocol
{
    let configureView:((CookItem, ViewCookFavourite) -> ()) = CookItem.showFavouriteNotSelected
    let selected:((CookItem, Cloud, Database, @escaping(() -> ())) -> ()) = CookItem.addFavouriteItem
    let type:CookItemFavouriteType = CookItemFavouriteType.off
}
