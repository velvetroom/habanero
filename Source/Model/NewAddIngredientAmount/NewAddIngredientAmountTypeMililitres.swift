import Foundation

struct NewAddIngredientAmountTypeMililitres:NewAddIngredientAmountTypeProtocol
{
    let name:String = String.localizedModel(key:"NewAddIngredientAmountTypeMililitres_name")
    
    //MARK: private
    
    private static func amountToMililitres(amount:String) -> Int32
    {
        guard
            
            let mililitres:Int32 = Int32(amount)
            
        else
        {
            return NewAddIngredientAmountType.Constants.defaultMililitres
        }
        
        return mililitres
    }
    
    //MARK: internal
    
    func createIngredient(
        amount:String,
        database:Database,
        completion:@escaping((BuildIngredient) -> ()))
    {
        let mililitres:Int32 = NewAddIngredientAmountTypeMililitres.amountToMililitres(amount:amount)
        
        database.create
        { (ingredient:BuildIngredientMililitres) in
            
            ingredient.mililitres = mililitres
            
            completion(ingredient)
        }
    }
}
