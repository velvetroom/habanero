import Foundation

final class Home:Model<ArchHome>
{
    var settings:Settings?
    var items:[CookItem]
    var recipesMap:[String:CookItem]
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
        
        super.init()
    }
}
