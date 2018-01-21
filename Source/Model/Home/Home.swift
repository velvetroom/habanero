import Foundation

final class Home:Model<ArchHome>
{
    var settings:Settings?
    var database:Database?
    var items:[CookItem]
    var recipesMap:[String:CookItem]
    let cloud:Cloud
    let storage:Storage
    
    required init()
    {
        self.cloud = Cloud()
        self.storage = Storage()
        self.items = []
        self.recipesMap = [:]
        
        super.init()
    }
}
