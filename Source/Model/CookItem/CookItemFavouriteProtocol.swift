import Foundation

protocol CookItemFavouriteProtocol
{
    static var configureView:((ViewCookFavourite) -> ()) { get }
    static var selected:((CookItem, @escaping(() -> ())) -> ()) { get }
}
