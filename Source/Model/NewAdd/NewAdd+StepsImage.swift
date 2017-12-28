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
    
    //MARK: private
    
    private func localURLForImage(identifier:String) -> URL?
    {
        guard
        
            let imageDirectory:URL = NewAdd.stepsImageDirectory
        
        else
        {
            return nil
        }
        
        let localURL:URL = imageDirectory.appendingPathComponent(identifier)
        
        return localURL
    }
    
    private func store(
        image:UIImage,
        at localURL:URL) throws
    {
        guard
        
            let imageData:Data = UIImagePNGRepresentation(image)
        
        else
        {
            throw NewAddError.invalidImageData
        }
        
        do
        {
            try imageData.write(
                to:localURL,
                options:Data.WritingOptions.atomicWrite)
        }
        catch let error
        {
            throw error
        }
    }
    
    //MARK: internal
    
    func storeImageLocally(image:UIImage) -> String?
    {
        let identifier:String = UUID().uuidString
        
        guard
        
            let localURL:URL = self.localURLForImage(identifier:identifier)
        
        else
        {
            return nil
        }
        
        do
        {
            try self.store(
                image:image,
                at:localURL)
        }
        catch
        {
            return nil
        }
        
        return identifier
    }
}
