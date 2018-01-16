import UIKit

final class HomeItem
{
    let recipe:Recipe
    var ingredients:[RecipeIngredient]
    var steps:[RecipeStep]
    var onImageUpdated:((HomeItem) -> ())?
    
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
