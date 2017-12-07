import Foundation

final class NewAdd:Model<ArchNewAdd>
{
    let sections:[NewAddSection]
    
    required init()
    {
        self.sections = NewAdd.factorySections()
        
        super.init()
    }
}
