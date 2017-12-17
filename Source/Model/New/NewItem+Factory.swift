import Foundation

extension NewItem
{
    //MARK: private
    
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
        
        let item:NewItem = NewItem(
            title:title,
            duration:duration,
            steps:steps,
            build:build)
        
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
