import Foundation

struct NewAddDeleteStrategyInfoImage:NewAddDeleteStrategyProtocol
{
    //MARK: private
    
    private static func deleteImage(imageIdentifier:String)
    {
        guard
        
            let imageURL:URL = NewAdd.localURLForImage(identifier:imageIdentifier)
        
        else
        {
            return
        }
        
        do
        {
            try NewAdd.deleteImage(localURL:imageURL)
        }
        catch { }
    }
    
    //MARK: internal
    
    static func delete(
        build:Build,
        database:Database,
        completion:@escaping (() -> ()))
    {
        if let imageIdentifier:String = build.imageIdentifier
        {
            NewAddDeleteStrategyInfoImage.deleteImage(imageIdentifier:imageIdentifier)
        }
        
        completion()
    }
}
