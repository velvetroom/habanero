import Foundation

final class Options:Model<ArchOptions>
{
    var settings:Settings?
    let items:[OptionsItemProtocol]
    let database:Database
    
    required init()
    {
        self.items = Options.factoryItems()
        self.database = Database()
        
        super.init()
    }
}
