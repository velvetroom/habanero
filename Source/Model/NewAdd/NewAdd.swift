import Foundation

final class NewAdd:Model<ArchNewAdd>
{
    let sections:[NewAddSectionProtocol]
    
    required init()
    {
        self.sections = NewAdd.factorySections()
        
        super.init()
    }
}
