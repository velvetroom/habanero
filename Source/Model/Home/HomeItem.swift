import UIKit

final class HomeItem
{
    let recipe:Recipe
    var image:UIImage?
    weak var cell:ViewHomeListCell?
    
    init(recipe:Recipe)
    {
        self.recipe = recipe
    }
}
