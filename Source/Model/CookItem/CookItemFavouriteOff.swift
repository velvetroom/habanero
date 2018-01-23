import Foundation

struct CookItemFavouriteOff:CookItemFavouriteProtocol
{
    static func configureFavourite(viewFavourite:ViewCookFavourite)
    {
        viewFavourite.isSelected = false
    }
}
