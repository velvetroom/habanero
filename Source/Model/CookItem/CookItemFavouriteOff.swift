import Foundation

struct CookItemFavouriteOff:CookItemFavouriteProtocol
{
    static var configureView:((ViewCookFavourite) -> ()) = CookItem.showFavouriteNotSelected
    static var selected:((CookItem, Cloud, Database, @escaping(() -> ())) -> ()) = CookItem.addFavouriteItem
}
