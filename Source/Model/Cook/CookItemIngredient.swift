import UIKit

struct CookItemIngredient:CookItemProtocol
{
    let reusableIdentifier:String = ViewCookListCellIngredient.reusableIdentifier
    let cellHeight:CGFloat = Cook.Constants.ingredientCellHeight
    let recipeIngredient:RecipeIngredient
}
