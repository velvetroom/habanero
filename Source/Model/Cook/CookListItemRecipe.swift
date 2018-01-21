import UIKit

struct CookListItemRecipe:CookListItemProtocol
{
    let reusableIdentifier:String = ViewCookListCellRecipe.reusableIdentifier
    let cellHeight:CGFloat = Cook.Constants.recipeCellHeight
    let recipe:Recipe
}
