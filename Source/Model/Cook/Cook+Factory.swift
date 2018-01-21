import Foundation

extension Cook
{
    //MARK: private
    
    private class func factoryIngredientItems(
        cookItem:CookItem,
        settings:Settings) -> [CookListItemProtocol]
    {
        var items:[CookListItemIngredient] = []
        
        for ingredient:RecipeIngredient in cookItem.ingredients
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
        cookItem:CookItem,
        settings:Settings) -> [CookListItemProtocol]
    {
        let itemRecipe:CookListItemRecipe = CookListItemRecipe(recipe:cookItem.recipe)
        let itemIngredientsTitle:CookListItemIngredientsTitle = CookListItemIngredientsTitle()
        
        let itemsIngredient:[CookListItemProtocol] = Cook.factoryIngredientItems(
            cookItem:cookItem,
            settings:settings)
        
        var items:[CookListItemProtocol] = [
            itemRecipe,
            itemIngredientsTitle]
        
        items.append(contentsOf:itemsIngredient)
        
        return items
    }
}
