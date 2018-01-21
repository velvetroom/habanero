import Foundation

extension Cook
{
    //MARK: private
    
    private class func factoryIngredientItems(
        homeItem:HomeItem,
        settings:Settings) -> [CookListItemProtocol]
    {
        var items:[CookListItemIngredient] = []
        
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
            
            let item:CookListItemIngredient = CookListItemIngredient(
                ingredient:ingredient.ingredientName.localizedCapitalized,
                amount:amount)
            
            items.append(item)
        }
        
        return items
    }
    
    //MARK: internal
    
    class func factoryItems(
        homeItem:HomeItem,
        settings:Settings) -> [CookListItemProtocol]
    {
        let itemRecipe:CookListItemRecipe = CookListItemRecipe(recipe:homeItem.recipe)
        let itemIngredientsTitle:CookListItemIngredientsTitle = CookListItemIngredientsTitle()
        
        let itemsIngredient:[CookListItemProtocol] = Cook.factoryIngredientItems(
            homeItem:homeItem,
            settings:settings)
        
        var items:[CookListItemProtocol] = [
            itemRecipe,
            itemIngredientsTitle]
        
        items.append(contentsOf:itemsIngredient)
        
        return items
    }
}
