import Foundation

protocol CookItemFavouriteProtocol
{
    static var configureView:((CookItem, ViewCookFavourite) -> ()) { get }
    static var selected:((CookItem, Cloud, Database, @escaping(() -> ())) -> ()) { get }
}
