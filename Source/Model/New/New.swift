import Foundation

final class New:Model<ArchNew>
{
    var settings:Settings?
    var database:Database?
    var items:[NewItem]
    
    required init()
    {
        self.items = []
        
        super.init()
    }
}
