import UIKit

struct NewAddSectionIngredients:NewAddSectionProtocol
{
    let title:String
    let footerReusableIdentifier:String
    let headerHeight:CGFloat
    let items:[NewAddSectionItemProtocol]
    
    init(
        build:Build,
        settings:Settings)
    {
        self.title = String.localizedModel(key:"NewAdd_ingredientsSectionTitle")
        self.footerReusableIdentifier = ViewNewAddListFooterIngredients.reusableIdentifier
        self.headerHeight = NewAdd.Constants.headerIngredientsHeight
        
        self.items = NewAddSectionIngredients.factoryItems(
            build:build,
            settings:settings)
    }
    
    //MARK: private
    
    private static func factoryItems(
        build:Build,
        settings:Settings) -> [NewAddSectionItemIngredient]
    {
        guard
            
            let ingredients:[BuildIngredient] = build.ingredientList
        
        else
        {
            return []
        }
        
        var items:[NewAddSectionItemIngredient] = []
        
        for ingredient:BuildIngredient in ingredients
        {
            guard
            
                let name:String = ingredient.name,
                let amount:String = ViewFormat.factoryAmount(
                    ingredient:ingredient,
                    settings:settings)
            
            else
            {
                continue
            }
            
            let item:NewAddSectionItemIngredient = NewAddSectionItemIngredient(
                name:name,
                amount:amount)
            
            items.append(item)
        }
        
        return items
    }
}
