import Foundation

struct NewAddIngredientAmountTypeQuantity:NewAddIngredientAmountTypeProtocol
{
    let name:String = String.localizedModel(key:"NewAddIngredientAmountTypeQuantity_name")
    
    //MARK: private
    
    private static func amountToQuantity(amount:String) -> Float
    {
        guard
            
            let quantity:Float = Float(amount)
            
        else
        {
            return NewAddIngredientAmountType.Constants.defaultQuantity
        }
        
        return quantity
    }
    
    //MARK: internal
    
    func createIngredient(
        amount:String,
        database:Database,
        completion:@escaping((BuildIngredient) -> ()))
    {
        let quantity:Float = NewAddIngredientAmountTypeQuantity.amountToQuantity(amount:amount)
        
        database.createBuildIngredientQuantity(
            quantity:quantity,
            completion:completion)
    }
}
