import UIKit

struct CookListItemIngredient:CookListItemProtocol
{
    let reusableIdentifier:String = ViewCookListCellIngredient.reusableIdentifier
    let cellHeight:CGFloat = Cook.Constants.ingredientCellHeight
    let ingredient:String
    let amount:String
}
