import Foundation

struct CookItemFavouriteOn:CookItemFavouriteProtocol
{
    let recipeFavourite:RecipeFavourite
    let configureView:((CookItem, ViewCookFavourite) -> ()) = CookItem.showFavouriteSelected
    let selected:((CookItem, Cloud, Database, @escaping(() -> ())) -> ()) = CookItem.removeFavouriteItem
    let type:CookItemFavouriteType = CookItemFavouriteType.on
}
