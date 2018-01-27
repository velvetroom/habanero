import Foundation

final class Recipe:CloudItemProtocol
{
    let created:TimeInterval
    let duration:TimeInterval
    let syncstamp:TimeInterval
    let identifier:String
    let parentPath:String
    let title:String
    let subtitle:String
    let status:RecipeStatus
    var favourites:Int
    
    init?(
        identifier:String,
        parentPath:String,
        json:[String:Any])
    {
        guard
            
            let rawStatus:Int = json[Recipe.Keys.status] as? Int,
            let status:RecipeStatus = RecipeStatus(rawValue:rawStatus),
            let created:TimeInterval = json[Recipe.Keys.created] as? TimeInterval,
            let duration:TimeInterval = json[Recipe.Keys.duration] as? TimeInterval,
            let syncstamp:TimeInterval = json[Recipe.Keys.syncstamp] as? TimeInterval,
            let title:String = json[Recipe.Keys.title] as? String,
            let subtitle:String = json[Recipe.Keys.subtitle] as? String
            
        else
        {
            return nil
        }
        
        if let favourites:Int = json[Recipe.Keys.favourites] as? Int
        {
            self.favourites = favourites
        }
        else
        {
            self.favourites = 0
        }
        
        self.parentPath = parentPath
        self.identifier = identifier
        self.status = status
        self.created = created
        self.duration = duration
        self.syncstamp = syncstamp
        self.title = title
        self.subtitle = subtitle
    }
}
