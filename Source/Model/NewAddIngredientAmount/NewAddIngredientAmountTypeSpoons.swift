import Foundation

struct NewAddIngredientAmountTypeSpoons:NewAddIngredientAmountTypeProtocol
{
    let name:String = String.localizedModel(key:"NewAddIngredientAmountTypeSpoons_name")
    
    //MARK: private
    
    private static func amountToSpoons(amount:String) -> Int16
    {
        guard
            
            let spoons:Int16 = Int16(amount)
            
        else
        {
            return NewAddIngredientAmountType.Constants.defaultSpoons
        }
        
        return spoons
    }
    
    //MARK: internal
    
    func createIngredient(
        amount:String,
        database:Database,
        completion:@escaping((BuildIngredient) -> ()))
    {
        let spoons:Int16 = NewAddIngredientAmountTypeSpoons.amountToSpoons(amount:amount)
        
        database.createBuildIngredientSpoons(
            spoons:spoons,
            completion:completion)
    }
}
