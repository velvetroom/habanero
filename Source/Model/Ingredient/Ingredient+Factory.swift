import Foundation

extension Ingredient
{
    //MARK: internal
    
    class func factoryJson(name:String) -> [String:Any]
    {
        let json:[String:Any] = [
            Ingredient.Keys.name : name]
        
        return json
    }
    
    class func factoryJson(ingredient:Ingredient) -> [String:Any]
    {
        let name:String = ingredient.name
        let json:[String:Any] = Ingredient.factoryJson(name:name)
        
        return json
    }
}
