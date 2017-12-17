import Foundation

final class NewAddIngredient:Model<ArchNewAddIngredient>
{
    var build:Build?
    var database:Database?
    let cloud:Cloud
    private(set) var searching:String
    private(set) var items:[Ingredient]
    private var ingredients:[Ingredient]
    
    required init()
    {
        self.cloud = Cloud()
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
                continue
            }
            
            items.append(ingredient)
        }
        
        DispatchQueue.main.async
        { [weak self] in
            
            self?.ingredientsFound(
                searching:searching,
                items:items,
                completion:completion)
        }
    }
    
    private func ingredientsFound(
        searching:String,
        items:[Ingredient],
        completion:(() -> ()))
    {
        self.searching = searching
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
    
    func updateItems(ingredients:[Ingredient])
    {
        self.ingredients = ingredients
        self.items = ingredients
    }
}
