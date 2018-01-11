import UIKit

struct CookItemRecipe:CookItemProtocol
{
    let reusableIdentifier:String = ViewCookListCellRecipe.reusableIdentifier
    let cellHeight:CGFloat = Cook.Constants.recipeCellHeight
    let recipe:Recipe
}
