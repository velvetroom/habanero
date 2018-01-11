import Foundation

extension Cook
{
    //MARK: private
    
    private class func factoryIngredientItems(recipe:Recipe) -> [CookItemProtocol]
    {
        return []
    }
    
    //MARK: internal
    
    class func factoryItems(recipe:Recipe) -> [CookItemProtocol]
    {
        let itemTitle:CookItemTitle = CookItemTitle(recipe:recipe)
        let itemIngredientsTitle:CookItemIngredientsTitle = CookItemIngredientsTitle()
        let itemsIngredient:[CookItemProtocol] = Cook.factoryIngredientItems(recipe:recipe)
        
        var items:[CookItemProtocol] = [
            itemTitle,
            itemIngredientsTitle]
        
        items.append(contentsOf:itemsIngredient)
        
        return items
    }
}
