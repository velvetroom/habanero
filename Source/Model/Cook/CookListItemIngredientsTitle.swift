import UIKit

struct CookListItemIngredientsTitle:CookListItemProtocol
{
    let reusableIdentifier:String = ViewCookListCellIngredientsTitle.reusableIdentifier
    let cellHeight:CGFloat = Cook.Constants.ingredientsTitleCellHeight
}
