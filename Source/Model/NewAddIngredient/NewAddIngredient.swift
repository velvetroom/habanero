import Foundation

final class NewAddIngredient:Model<ArchNewAddIngredient>
{
    var build:Build?
    var database:Database?
    private(set) var searching:String
    private(set) var items:[Ingredient]
    private var ingredients:[Ingredient]
    
    required init()
    {
        self.items = []
        self.ingredients = []
        self.searching = String()
        
        super.init()
    }
    
    //MARK: private
    
    private func asyncSearchIngredient(
        searching:String,
        completion:@escaping(() -> ()))
    {
        var items:[Ingredient] = []
        
        for ingredient:Ingredient in self.ingredients
        {
            guard
            
                ingredient.name.contains(searching) == true
            
            else
            {
                return
            }
            
            items.append(ingredient)
        }
        
        DispatchQueue.global(qos:DispatchQoS.QoSClass.background).async
        { [weak self] in
            
            self?.ingredientsFound(
                items:items,
                completion:completion)
        }
    }
    
    private func ingredientsFound(
        items:[Ingredient],
        completion:(() -> ()))
    {
        self.items = items
        completion()
    }
    
    //MARK: internal
    
    func searchIngredient(
        searching:String,
        completion:@escaping(() -> ()))
    {
        DispatchQueue.global(qos:DispatchQoS.QoSClass.background).async
        { [weak self] in
            
            self?.asyncSearchIngredient(
                searching:searching,
                completion:completion)
        }
    }
}
