import UIKit

final class NewAdd:Model<ArchNewAdd>
{
    var build:Build?
    var settings:Settings?
    var sections:[NewAddSectionProtocol]
    var movingCellDelta:CGPoint?
    let cloud:Cloud
    let storage:Storage
    let database:Database
    
    required init()
    {
        self.sections = []
        self.cloud = Cloud()
        self.storage = Storage()
        self.database = Database()
        
        super.init()
    }
}
