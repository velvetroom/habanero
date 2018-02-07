import Foundation

protocol CookItemFavouriteProtocol
{
    var configureView:((CookItem, ViewCookFavourite) -> ()) { get }
    var selected:((CookItem, Cloud, Database, @escaping(() -> ())) -> ()) { get }
    var type:CookItemFavouriteType { get }
}
