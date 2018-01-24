import Foundation

extension Cloud
{
    //MARK: internal
    
    func addToFavourites(
        recipe:Recipe,
        completion:@escaping((Error?) -> ()))
    {
        self.provider.increaseProperty(
            property:Recipe.Keys.favourites,
            of:recipe,
            completion:completion)
    }
    
    func removeFromFavourites(
        recipe:Recipe,
        completion:@escaping((Error?) -> ()))
    {
        self.provider.decreaseProperty(
            property:Recipe.Keys.favourites,
            of:recipe,
            completion:completion)
    }
}
