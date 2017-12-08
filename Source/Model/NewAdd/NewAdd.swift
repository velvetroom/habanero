import Foundation

final class NewAdd:Model<ArchNewAdd>
{
    weak var database:Database?
    var build:Build?
    let sections:[NewAddSectionProtocol]
    
    required init()
    {
        self.sections = NewAdd.factorySections()
        
        super.init()
    }
}
