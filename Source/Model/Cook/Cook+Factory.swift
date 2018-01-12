import Foundation

extension Cook
{
    //MARK: private
    
    private class func factoryIngredientItems(
        homeItem:HomeItem,
        settings:Settings) -> [CookItemProtocol]
    {
        var items:[CookItemIngredient] = []
        
        for ingredient:RecipeIngredient in homeItem.ingredients
        {
            guard
            
                let amount:String = Format.factoryAmount(
                    recipeIngredient:ingredient,
                    settings:settings)
            
            else
            {
                continue
            }
            
            let item:CookItemIngredient = CookItemIngredient(
                ingredient:ingredient.ingredientName,
                amount:amount)
            
            items.append(item)
        }
        
        return items
    }
    
    //MARK: internal
    
    class func factoryItems(
        homeItem:HomeItem,
        settings:Settings) -> [CookItemProtocol]
    {
        let itemRecipe:CookItemRecipe = CookItemRecipe(recipe:homeItem.recipe)
        let itemIngredientsTitle:CookItemIngredientsTitle = CookItemIngredientsTitle()
        
        let itemsIngredient:[CookItemProtocol] = Cook.factoryIngredientItems(
            homeItem:homeItem,
            settings:settings)
        
        var items:[CookItemProtocol] = [
            itemRecipe,
            itemIngredientsTitle]
        
        items.append(contentsOf:itemsIngredient)
        
        return items
    }
}
