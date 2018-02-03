import Foundation

final class Home:Model<ArchHome>
{
    var settings:Settings?
    var items:[CookItem]
    var recipesMap:[String:CookItem]
    var filter:HomeFilter
    let database:Database
    let cloud:Cloud
    let storage:Storage
    
    required init()
    {
        self.database = Database()
        self.cloud = Cloud()
        self.storage = Storage()
        self.items = []
        self.recipesMap = [:]
        self.filter = Home.factoryFilter()
        
        super.init()
    }
}
