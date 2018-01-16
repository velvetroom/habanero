import Foundation

extension CookStep
{
    private static var typeRouter:[RecipeStepType:((RecipeStep) -> (CookStepItemProtocol?))]
    {
        get
        {
            let map:[RecipeStepType:((RecipeStep) -> (CookStepItemProtocol?))] = [
                RecipeStepType.text : CookStep.factoryItemText,
                RecipeStepType.image : CookStep.factoryItemImage]
            
            return map
        }
    }
    
    //MARK: private
    
    private class func factoryItemText(step:RecipeStep) -> CookStepItemProtocol?
    {
        guard
        
            let step:RecipeStepText = step as? RecipeStepText
        
        else
        {
            return nil
        }
        
        let item:CookStepItemText = CookStepItemText(text:step.text)
        
        return item
    }
    
    private class func factoryItemImage(step:RecipeStep) -> CookStepItemProtocol?
    {
        guard
            
            let step:RecipeStepImage = step as? RecipeStepImage
            
        else
        {
            return nil
        }
        
        let item:CookStepItemImage = CookStepItemImage(
            text:step.text,
            imageIdentifier:step.identifier)
        
        return item
    }
    
    //MARK: internal
    
    class func factoryItems(homeItem:HomeItem) -> [CookStepItemProtocol]
    {
        var items:[CookStepItemProtocol] = []
        
        for step:RecipeStep in homeItem.steps
        {
            guard
            
                let router:((RecipeStep) -> (CookStepItemProtocol?)) = CookStep.typeRouter[step.stepType],
                let item:CookStepItemProtocol = router(step)
            
            else
            {
                continue
            }
            
            items.append(item)
        }
        
        return items
    }
}
