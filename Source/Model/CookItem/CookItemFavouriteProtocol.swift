import Foundation

protocol CookItemFavouriteProtocol
{
    static var configureView:((ViewCookFavourite) -> ()) { get }
    static var selected:((CookItem, Cloud, Database, @escaping(() -> ())) -> ()) { get }
}
