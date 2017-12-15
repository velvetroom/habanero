import Foundation

final class NewAddIngredientAmount:Model<ArchNewAddIngredientAmount>
{
    var ingredient:Ingredient?
    var build:Build?
    var database:Database?
    
    let types:[NewAddIngredientAmountTypeProtocol]
    
    required init()
    {
        self.types = NewAddIngredientAmount.factoryTypes()
        
        super.init()
    }
}
