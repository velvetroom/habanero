import Foundation

extension NewAddIngredientAmount
{
    //MARK: internal
    
    class func factoryTypes() -> [NewAddIngredientAmountTypeProtocol]
    {
        let typeCups:NewAddIngredientAmountTypeCups = NewAddIngredientAmountTypeCups()
        let typeGrams:NewAddIngredientAmountTypeGrams = NewAddIngredientAmountTypeGrams()
        let typeMililitres:NewAddIngredientAmountTypeMililitres = NewAddIngredientAmountTypeMililitres()
        let typeQuantity:NewAddIngredientAmountTypeQuantity = NewAddIngredientAmountTypeQuantity()
        let typeSpoons:NewAddIngredientAmountTypeSpoons = NewAddIngredientAmountTypeSpoons()
        
        let types:[NewAddIngredientAmountTypeProtocol] = [
            typeQuantity,
            typeCups,
            typeSpoons,
            typeGrams,
            typeMililitres]
        
        return types
    }
}
