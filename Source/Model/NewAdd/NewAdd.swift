import UIKit

final class NewAdd:Model<ArchNewAdd>
{
    weak var database:Database?
    var build:Build?
    var settings:Settings?
    var sections:[NewAddSectionProtocol]
    var movingCellDelta:CGPoint?
    let cloud:Cloud
    
    required init()
    {
        self.sections = []
        self.cloud = Cloud()
        
        super.init()
    }
}
