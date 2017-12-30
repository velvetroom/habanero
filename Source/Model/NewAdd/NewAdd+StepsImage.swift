import UIKit

extension NewAdd
{
    static var stepsImageDirectory:URL?
    {
        get
        {
            var directory:URL = FileManager.default.appDirectory.appendingPathComponent(
                NewAdd.Constants.stepsImageDirectory)
            
            let directoryExists:Bool = FileManager.default.fileExists(atPath:directory.path)
            
            if directoryExists == false
            {
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
            }
            
            return directory
        }
    }
    
    //MARK: internal
    
    class func localURLForImage(identifier:String) -> URL?
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
    
    func storeImageLocally(image:UIImage) -> String?
    {
        let identifier:String = UUID().uuidString
        
        guard
        
            let localURL:URL = NewAdd.localURLForImage(identifier:identifier)
        
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
    
    func store(
        image:UIImage,
        at localURL:URL) throws
    {
        try self.deleteImage(localURL:localURL)
        
        guard
            
            let imageData:Data = UIImagePNGRepresentation(image)
            
        else
        {
            throw NewAddError.invalidImageData
        }
        
        try imageData.write(
            to:localURL,
            options:Data.WritingOptions.atomicWrite)
    }
    
    func deleteImage(localURL:URL) throws
    {
        let fileExists:Bool = FileManager.default.fileExists(atPath:localURL.path)
        
        if fileExists
        {
            try FileManager.default.removeItem(at:localURL)
        }
    }
}
