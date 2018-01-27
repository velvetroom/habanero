import Foundation

final class New:Model<ArchNew>
{
    var settings:Settings?
    var items:[NewItem]
    let database:Database
    
    required init()
    {
        self.database = Database()
        self.items = []
        
        super.init()
    }
}
