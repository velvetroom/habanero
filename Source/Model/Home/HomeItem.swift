import UIKit

final class HomeItem
{
    let recipe:Recipe
    var ingredients:[RecipeIngredient]
    var image:UIImage?
    
    init(recipe:Recipe)
    {
        self.recipe = recipe
        self.ingredients = []
    }
}
