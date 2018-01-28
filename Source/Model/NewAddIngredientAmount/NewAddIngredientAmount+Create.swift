import Foundation

extension NewAddIngredientAmount
{
    //MARK: private
    
    private func asyncCreateIngredient(
        amount:String,
        completion:@escaping(() -> ()))
    {
        guard
        
            let cloudIngredient:Ingredient = self.ingredient,
            let build:Build = self.build,
            let database:Database = self.database
        
        else
        {
            return
        }
        
        self.selectedType?.createIngredient(
            ingredientIdentifier:cloudIngredient.identifier,
            name:cloudIngredient.name,
            amount:amount,
            build:build,
            database:database)
        { [weak self] (ingredient:BuildIngredient) in
            
            self?.configureIngredient(
                buildIngredient:ingredient,
                completion:completion)
            
            self?.ingredientCreated(completion:completion)
        }
    }
    
    private func ingredientCreated(completion:@escaping(() -> ()))
    {
        DispatchQueue.main.async
        {
            completion()
        }
    }
    
    //MARK: internal
    
    func createIngredient(
        amount:String,
        completion:@escaping(() -> ()))
    {
        DispatchQueue.global(qos:DispatchQoS.QoSClass.background).async
        { [weak self] in
            
            self?.asyncCreateIngredient(
                amount:amount,
                completion:completion)
        }
    }
}
