import Foundation

final class Home:Model<ArchHome>
{
    var settings:Settings?
    var database:Database?
    var items:[HomeItem]
    let cloud:Cloud
    let storage:Storage
    
    required init()
    {
        self.cloud = Cloud()
        self.storage = Storage()
        self.items = []
        
        super.init()
    }
}
