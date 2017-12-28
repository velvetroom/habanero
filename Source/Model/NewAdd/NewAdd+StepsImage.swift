import UIKit

extension NewAdd
{
    private static var stepsImageDirectory:URL?
    {
        get
        {
            var directory:URL = FileManager.default.appDirectory.appendingPathComponent(
                NewAdd.Constants.stepsImageDirectory)
            directory.excludeFromBackup()
            
            do
            {
                try FileManager.default.createDirectory(
                    at:directory,
                    withIntermediateDirectories:true,
                    attributes:nil)
            }
            catch
            {
                return nil
            }
            
            return directory
        }
    }
    
    //MARK: internal
    
    func saveImageLocally() -> URL?
    {
        
    }
}
