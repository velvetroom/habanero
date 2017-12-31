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
    
    static func factoryJson(item:Ingredient) -> [String:Any]
    {
        var json:[String:Any] = []
        json[Ingredient.Keys.name] = item.name
        
        return json
    }
}
