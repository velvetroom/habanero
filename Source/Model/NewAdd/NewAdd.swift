import Foundation

final class NewAdd:Model<ArchNewAdd>
{
    weak var database:Database?
    var build:Build?
    var settings:Settings?
    var sections:[NewAddSectionProtocol]
    
    required init()
    {
        self.sections = []
        
        super.init()
    }
}
