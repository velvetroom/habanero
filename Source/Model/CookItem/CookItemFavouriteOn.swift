import Foundation

struct CookItemFavouriteOn:CookItemFavouriteProtocol
{
    static var configureView:((ViewCookFavourite) -> ()) = CookItem.showFavouriteSelected
    static var selected:((CookItem, @escaping(() -> ())) -> ()) = CookItem.removeFavouriteItem
}
