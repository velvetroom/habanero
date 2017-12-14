import Foundation

final class ControllerNewAddIngredientAmount:Controller<ArchNewAddIngredientAmount>
{
    init(
        ingredient:Ingredient,
        build:Build,
        database:Database)
    {
        super.init()
        
        self.model.ingredient = ingredient
        self.model.build = build
        self.model.database = database
    }
    
    required init?(coder:NSCoder)
    {
        return nil
    }
}
