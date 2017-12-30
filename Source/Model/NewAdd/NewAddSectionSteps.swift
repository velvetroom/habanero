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
            
            let step:BuildStepImage = step as? BuildStepImage,
            let text:String = step.text,
            let imageIdentifier:String = step.imageIdentifier,
            let image:UIImage = NewAddSectionSteps.imageWithIdentifier(imageIdentifier:imageIdentifier)
            
        else
        {
            return nil
        }
        
        let item:NewAddSectionItemStepImage = NewAddSectionItemStepImage(
            image:image,
            text:text,
            step:step)
        
        return item
    }
    
    private static func imageWithIdentifier(imageIdentifier:String) -> UIImage?
    {
        guard
        
            let imageLocation:URL = NewAdd.localURLForImage(identifier:imageIdentifier)
        
        else
        {
            return nil
        }
        
        let imageData:Data
        
        do
        {
            try imageData = Data(
                contentsOf:imageLocation,
                options:Data.ReadingOptions.mappedIfSafe)
        }
        catch
        {
            return nil
        }
        
        let image:UIImage? = UIImage(data:imageData)
        
        return image
    }
}
