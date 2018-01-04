import UIKit

final class NewAdd:Model<ArchNewAdd>
{
    weak var database:Database?
    var build:Build?
    var settings:Settings?
    var sections:[NewAddSectionProtocol]
    var movingCellDelta:CGPoint?
    let cloud:Cloud
    let storage:Storage
    
    required init()
    {
        self.sections = []
        self.cloud = Cloud()
        self.storage = Storage()
        
        super.init()
    }
}
