import Foundation

struct CookItemFavouriteOn:CookItemFavouriteProtocol
{
    let recipeFavourite:RecipeFavourite
    
    static var configureView:((CookItem, ViewCookFavourite) -> ()) = CookItem.showFavouriteSelected
    static var selected:((CookItem, Cloud, Database, @escaping(() -> ())) -> ()) = CookItem.removeFavouriteItem
}
