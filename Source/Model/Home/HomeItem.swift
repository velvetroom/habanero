import UIKit

final class HomeItem
{
    let ingredients:[RecipeIngredient]
    let recipe:Recipe
    var image:UIImage?
    
    init(
        recipe:Recipe,
        ingredients:[RecipeIngredient])
    {
        self.ingredients = ingredients
        self.recipe = recipe
    }
}
