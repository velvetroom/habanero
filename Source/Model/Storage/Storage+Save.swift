import Foundation

extension Storage
{
    //MARK: private
    
    private class func dataFor(fileLocation:URL) -> Data?
    {
        let data:Data
        
        do
        {
            try data = Data(
                contentsOf:fileLocation,
                options:Data.ReadingOptions.mappedIfSafe)
        }
        catch
        {
            return nil
        }
        
        return data
    }
    
    //MARK: internal
    
    func saveRecipeImage(
        recipeIdentifier:String,
        build:Build,
        completion:@escaping((Error?) -> ()))
    {
        guard
            
            let imageIdentifier:String = build.imageIdentifier,
            let imageURL:URL = NewAdd.localURLForImage(identifier:imageIdentifier),
            let data:Data = Storage.dataFor(fileLocation:imageURL)
        
        else
        {
            return
        }
        
        self.provider.save(
            data:data,
            with:recipeIdentifier,
            at:StorageContainer.recipe,
            completion:completion)
    }
}
