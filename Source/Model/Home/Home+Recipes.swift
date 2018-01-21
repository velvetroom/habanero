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
            
            self?.mergeRecipes(
                recipeList:recipeList,
                completion:completion)
        }
    }
    
    private func mergeRecipes(
        recipeList:RecipeList,
        completion:@escaping(() -> ()))
    {
        for recipe:Recipe in recipeList.items
        {
            guard
            
                self.recipesMap[recipe.identifier] == nil
            
            else
            {
                continue
            }
            
            let item:CookItem = CookItem(recipe:recipe)
            
            self.recipesMap[recipe.identifier] = item
        }
        
        self.sortItems(completion:completion)
    }
    
    private func sortItems(completion:@escaping(() -> ()))
    {
        var items:[CookItem] = Array(self.recipesMap.values)
        
        items.sort
        { (itemA:CookItem, itemB:CookItem) -> Bool in
            
            return itemA.recipe.created > itemB.recipe.created
        }
        
        self.recipesLoaded(
            items:items,
            completion:completion)
    }
    
    private func recipesLoaded(
        items:[CookItem],
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
