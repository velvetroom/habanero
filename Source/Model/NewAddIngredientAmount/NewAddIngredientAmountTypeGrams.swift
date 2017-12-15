import Foundation

struct NewAddIngredientAmountTypeGrams:NewAddIngredientAmountTypeProtocol
{
    let name:String = String.localizedModel(key:"NewAddIngredientAmountTypeGrams_name")
    
    //MARK: private
    
    private static func amountToGrams(amount:String) -> Int32
    {
        guard
            
            let grams:Int32 = Int32(amount)
            
        else
        {
            return NewAddIngredientAmountType.Constants.defaultGrams
        }
        
        return grams
    }
    
    //MARK: internal
    
    func createIngredient(
        amount:String,
        database:Database,
        completion:@escaping((BuildIngredient) -> ()))
    {
        let grams:Int32 = NewAddIngredientAmountTypeGrams.amountToGrams(amount:amount)
        
        database.create
        { (ingredient:BuildIngredientGrams) in
            
            ingredient.grams = grams
            
            completion(ingredient)
        }
    }
}
