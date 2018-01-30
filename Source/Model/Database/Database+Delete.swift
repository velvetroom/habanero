import Foundation

extension Database
{
    //MARK: internal
    
    func deleteFavourite(
        favourite:RecipeFavourite,
        completion:@escaping(() -> ()))
    {
        self.provider.delete(model:favourite)
        { [weak self] in
            
            self?.provider.save(completion:completion)
        }
    }
}
