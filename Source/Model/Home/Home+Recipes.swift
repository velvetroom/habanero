import Foundation

extension Home
{
    //MARK: private
    
    private func asyncLoadRecipes(completion:@escaping(() -> ()))
    {
        self.cloud.loadRecipes
        { [weak self] (recipeList:RecipeList?, error:Error?) in
            
            guard
            
                error == nil,
                let recipeList:RecipeList = recipeList
            
            else
            {
                self?.recipesLoaded(
                    items:[],
                    completion:completion)
                
                return
            }
            
            self?.sortRecipes(
                recipeList:recipeList,
                completion:completion)
        }
    }
    
    private func sortRecipes(
        recipeList:RecipeList,
        completion:@escaping(() -> ()))
    {
        let recipes:[Recipe] = recipeList.items.sorted
        { (recipeA:Recipe, recipeB:Recipe) -> Bool in
            
            return recipeA.created <= recipeB.created
        }
        
        var items:[HomeItem] = []
        
        for recipe:Recipe in recipes
        {
            let item:HomeItem = HomeItem(recipe:recipe)
            items.append(item)
        }
        
        self.recipesLoaded(
            items:items,
            completion:completion)
    }
    
    private func recipesLoaded(
        items:[HomeItem],
        completion:@escaping(() -> ()))
    {
        self.items = items
        
        DispatchQueue.main.async
        {
            completion()
        }
    }
    
    //MARK: internal
    
    func loadRecipes(completion:@escaping(() -> ()))
    {
        DispatchQueue.global(qos:DispatchQoS.QoSClass.background).async
        { [weak self] in
            
            self?.asyncLoadRecipes(completion:completion)
        }
    }
}
