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
            
            let item:HomeItem = HomeItem(recipe:recipe)
            
            self.recipesMap[recipe.identifier] = item
        }
        
        self.sortItems(completion:completion)
    }
    
    private func sortItems(completion:@escaping(() -> ()))
    {
        var items:[HomeItem] = Array(self.recipesMap.values)
        
        items.sort
        { (itemA:HomeItem, itemB:HomeItem) -> Bool in
            
            return itemA.recipe.created > itemB.recipe.created
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
