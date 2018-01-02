import UIKit

extension NewItem
{
    //MARK: private
    
    private static func factoryItemImage(build:Build) -> UIImage?
    {
        guard
        
            let imageIdentifier:String = build.imageIdentifier
        
        else
        {
            return nil
        }
        
        let image:UIImage? = NewAdd.localImageForIdentifier(identifier:imageIdentifier)
        
        return image
    }
    
    private static func factoryItem(build:Build) -> NewItem?
    {
        guard
        
            let title:String = build.title,
            let steps:Int = build.steps?.count,
            let duration:String = Format.factoryDuration(duration:build.duration)
        
        else
        {
            return nil
        }
        
        let image:UIImage? = NewItem.factoryItemImage(build:build)
        
        let item:NewItem = NewItem(
            title:title,
            duration:duration,
            steps:steps,
            build:build,
            image:image)
        
        return item
    }
    
    //MARK: internal
    
    static func factoryItems(builds:[Build]) -> [NewItem]
    {
        var items:[NewItem] = []
        
        for build:Build in builds
        {
            guard
            
                let item:NewItem = NewItem.factoryItem(build:build)
            
            else
            {
                continue
            }
            
            items.append(item)
        }
        
        return items
    }
}
