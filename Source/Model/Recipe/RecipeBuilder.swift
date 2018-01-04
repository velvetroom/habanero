import Foundation

struct RecipeBuilder:CloudItemBuilderProtocol
{
    var created:TimeInterval
    var duration:TimeInterval
    var syncstamp:TimeInterval
    var title:String
    var subtitle:String
    var status:RecipeStatus
    
    var json:[String:Any]
    {
        get
        {
            let json:[String:Any] = [
                Recipe.Keys.created : self.created,
                Recipe.Keys.duration : self.duration,
                Recipe.Keys.syncstamp : self.syncstamp,
                Recipe.Keys.title : self.title,
                Recipe.Keys.subtitle : self.subtitle,
                Recipe.Keys.status : self.status.rawValue]
            
            return json
        }
    }
    
    init()
    {
        self.created = 0
        self.duration = 0
        self.syncstamp = 0
        self.title = String()
        self.subtitle = String()
        self.status = RecipeStatus.unknown
    }
}
