import Foundation

final class Options:Model<ArchOptions>
{
    let items:[OptionsItemProtocol]
    
    required init()
    {
        self.items = Options.factoryItems()
        
        super.init()
    }
}
