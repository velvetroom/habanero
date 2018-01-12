import Foundation

extension Cook
{
    //MARK: private
    
    private class func factoryIngredientItems(homeItem:HomeItem) -> [CookItemProtocol]
    {
        for ingredient:RecipeIngredient in homeItem.ingredients
        {
            print("\(ingredient)")
        }
        
        return []
    }
    
    //MARK: internal
    
    class func factoryItems(homeItem:HomeItem) -> [CookItemProtocol]
    {
        let itemRecipe:CookItemRecipe = CookItemRecipe(recipe:homeItem.recipe)
        let itemIngredientsTitle:CookItemIngredientsTitle = CookItemIngredientsTitle()
        let itemsIngredient:[CookItemProtocol] = Cook.factoryIngredientItems(homeItem:homeItem)
        
        var items:[CookItemProtocol] = [
            itemRecipe,
            itemIngredientsTitle]
        
        items.append(contentsOf:itemsIngredient)
        
        return items
    }
}
