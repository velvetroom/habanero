import Foundation

final class NewAdd:Model<ArchNewAdd>
{
    weak var database:Database?
    var build:Build?
    var settings:Settings?
    var sections:[NewAddSectionProtocol]
    
    static var stepsImageDirectory:URL?
    {
        get
        {
            let directory:URL = FileManager.default.appDirectory.appendingPathComponent(
                NewAdd.Constants.stepsImageDirectory)
            
            return directory
        }
    }
    
    required init()
    {
        self.sections = []
        
        super.init()
    }
}
