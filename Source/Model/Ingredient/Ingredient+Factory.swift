import Foundation

extension Ingredient
{
    //MARK: internal
    
    class func factoryJson(name:String) -> Any
    {
        let json:[String:Any] = [
            Ingredient.Keys.name : name]
        
        return json
    }
    
    class func factoryJson(ingredient:Ingredient) -> Any
    {
        let name:String = ingredient.name
        let json:Any = Ingredient.factoryJson(name:name)
        
        return json
    }
}
