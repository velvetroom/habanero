import UIKit

final class CookItem
{
    var ingredients:[RecipeIngredient]
    var steps:[RecipeStep]
    var recipeFavourite:RecipeFavourite?
    var onImageUpdated:((CookItem) -> ())?
    var favourite:CookItemFavouriteProtocol
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
        self.favourite = CookItemFavouriteOff.self
    }
}
