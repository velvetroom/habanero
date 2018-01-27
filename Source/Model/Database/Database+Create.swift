import Foundation

extension Database
{
    //MARK: internal
    
    func createSettings(completion:@escaping((Settings) -> ()))
    {
        self.provider.create(completion:completion)
    }
    
    func createRecipeFavourite(completion:@escaping((RecipeFavourite) -> ()))
    {
        self.provider.create(completion:completion)
    }
}
