import UIKit

struct NewAddSectionSteps:NewAddSectionProtocol
{
    private static var stepRouters:[RecipeStepType:((BuildStep) -> (NewAddSectionItemProtocol?))]
    {
        get
        {
            let map:[RecipeStepType:((BuildStep) -> (NewAddSectionItemProtocol?))] = [
                RecipeStepType.image : NewAddSectionSteps.factoryStepImage,
                RecipeStepType.text : NewAddSectionSteps.factoryStepText]
            
            return map
        }
    }
    
    let title:String
    let footerReusableIdentifier:String
    let headerHeight:CGFloat
    let footerHeight:CGFloat
    let items:[NewAddSectionItemProtocol]
    
    init(
        build:Build,
        settings:Settings)
    {
        self.title = String.localizedModel(key:"NewAdd_stepsSectionTitle")
        self.footerReusableIdentifier = ViewNewAddListFooterSteps.reusableIdentifier
        self.headerHeight = NewAdd.Constants.headerStepsHeight
        self.footerHeight = NewAdd.Constants.footerStepsHeight
        
        self.items = NewAddSectionSteps.factoryItems(build:build)
    }
    
    //MARK: private
    
    private static func factoryItems(build:Build) -> [NewAddSectionItemProtocol]
    {
        var items:[NewAddSectionItemProtocol] = []
        
        guard
        
            let steps:[BuildStep] = build.stepList
        
        else
        {
            return items
        }
        
        for step:BuildStep in steps
        {
            guard
            
                let router:((BuildStep) -> (NewAddSectionItemProtocol?)) = NewAddSectionSteps.stepRouters[
                    step.recipeStepType],
                let item:NewAddSectionItemProtocol = router(step)
            
            else
            {
                continue
            }
            
            items.append(item)
        }
        
        return items
    }
    
    private static func factoryStepText(step:BuildStep) -> NewAddSectionItemProtocol?
    {
        guard
        
            let step:BuildStepText = step as? BuildStepText,
            let text:String = step.text
        
        else
        {
            return nil
        }
        
        let item:NewAddSectionItemStepText = NewAddSectionItemStepText(
            text:text,
            step:step)
        
        return item
    }
    
    private static func factoryStepImage(step:BuildStep) -> NewAddSectionItemProtocol?
    {
        guard
            
            let step:BuildStepText = step as? BuildStepText,
            let text:String = step.text
            
        else
        {
            return nil
        }
        
        let item:NewAddSectionItemStepText = NewAddSectionItemStepText(
            text:text,
            step:step)
        
        return item
    }
}
