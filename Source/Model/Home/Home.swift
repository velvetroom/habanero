import Foundation

final class Home:Model<ArchHome>
{
    var settings:Settings?
    var database:Database?
    var recipes:[Recipe]
    let cloud:Cloud
    let storage:Storage
    
    required init()
    {
        self.cloud = Cloud()
        self.storage = Storage()
        self.recipes = []
        
        super.init()
    }
}
