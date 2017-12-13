import Foundation

extension NewAddIngredient
{
    private func asyncSelectIngredient(
        ingredient:Ingredient,
        completion:@escaping((Error?) -> ()))
    {
        
    }
    
    //MARK: internal
    
    func selectIngredient(
        ingredient:Ingredient,
        completion:@escaping((Error?) -> ()))
    {
        DispatchQueue.global(qos:DispatchQoS.QoSClass.background).async
        { [weak self] in
            
            self?.asyncSelectIngredient(
                ingredient:ingredient,
                completion:completion)
        }
    }
}
