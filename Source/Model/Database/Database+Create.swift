import Foundation

extension Database
{
    //MARK: internal
    
    func createSettings(completion:@escaping((Settings) -> ()))
    {
        self.provider.create
        { [weak self] (settings:Settings) in
                
            self?.provider.save
            {
                completion(settings)
            }
        }
    }
    
    func createRecipeFavourite(
        identifier:String,
        completion:@escaping((RecipeFavourite) -> ()))
    {
        self.provider.create
        { [weak self] (recipeFavourite:RecipeFavourite) in
            
            recipeFavourite.recipeIdentifier = identifier
            
            self?.provider.save
            {
                completion(recipeFavourite)
            }
        }
    }
}
