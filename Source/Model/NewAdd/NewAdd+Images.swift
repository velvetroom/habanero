import UIKit

extension NewAdd
{
    private static var imagesDirectory:URL?
    {
        get
        {
            let directory:URL = FileManager.default.appDirectory.appendingPathComponent(
                NewAdd.Constants.imagesDirectory)
            
            do
            {
                try NewAdd.createDirectoryIfNeeded(directory:directory)
            }
            catch
            {
                return nil
            }
            
            return directory
        }
    }
    
    //MARK: private
    
    private static func createDirectoryIfNeeded(directory:URL) throws
    {
        var directory:URL = directory
        let directoryExists:Bool = FileManager.default.fileExists(atPath:directory.path)
        
        if directoryExists == false
        {
            directory.excludeFromBackup()
            
            try FileManager.default.createDirectory(
                at:directory,
                withIntermediateDirectories:true,
                attributes:nil)
        }
    }
    
    //MARK: internal
    
    class func localImageForIdentifier(identifier:String) -> UIImage?
    {
        guard
            
            let imageLocation:URL = NewAdd.localURLForImage(identifier:identifier)
            
        else
        {
            return nil
        }
        
        let imageData:Data
        
        do
        {
            try imageData = Data(
                contentsOf:imageLocation,
                options:Data.ReadingOptions.mappedIfSafe)
        }
        catch
        {
            return nil
        }
        
        let image:UIImage? = UIImage(data:imageData)
        
        return image
    }
    
    class func localURLForImage(identifier:String) -> URL?
    {
        guard
            
            let imageDirectory:URL = NewAdd.imagesDirectory
            
        else
        {
            return nil
        }
        
        let localURL:URL = imageDirectory.appendingPathComponent(identifier)
        
        return localURL
    }
    
    class func createIdentifierAndStoreLocally(image:UIImage) -> String?
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
            try NewAdd.store(
                image:image,
                at:localURL)
        }
        catch
        {
            return nil
        }
        
        return identifier
    }
    
    class func store(
        image:UIImage,
        at localURL:URL) throws
    {
        try NewAdd.deleteImage(localURL:localURL)
        
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
    
    class func deleteImage(localURL:URL) throws
    {
        let fileExists:Bool = FileManager.default.fileExists(atPath:localURL.path)
        
        if fileExists
        {
            try FileManager.default.removeItem(at:localURL)
        }
    }
}
