import Foundation

struct CookItemFavouriteOn:CookItemFavouriteProtocol
{
    static func configureFavourite(viewFavourite:ViewCookFavourite)
    {
        viewFavourite.isSelected = true
    }
}
