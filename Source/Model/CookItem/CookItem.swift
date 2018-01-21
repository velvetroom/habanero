import UIKit

final class CookItem
{
    var ingredients:[RecipeIngredient]
    var steps:[RecipeStep]
    var onImageUpdated:((CookItem) -> ())?
    let recipe:Recipe
    
    var image:UIImage?
    {
        didSet
        {
            self.onImageUpdated?(self)
            self.onImageUpdated = nil
        }
    }
    
    init(recipe:Recipe)
    {
        self.recipe = recipe
        self.ingredients = []
        self.steps = []
    }
}
