import Foundation

extension NewAddIngredientAmount
{
    //MARK: private
    
    private func asyncCreateIngredient(
        amount:String,
        completion:@escaping(() -> ()))
    {
        guard
        
            let database:Database = self.database,
            let type:NewAddIngredientAmountTypeProtocol = self.selectedType
        
        else
        {
            return
        }
        
        type.createIngredient(
            amount:amount,
            database:database)
        { [weak self] (ingredient:BuildIngredient) in
            
            self?.configureIngredient(
                buildIngredient:ingredient,
                database:database,
                completion:completion)
        }
    }
    
    private func configureIngredient(
        buildIngredient:BuildIngredient,
        database:Database,
        completion:@escaping(() -> ()))
    {
        guard
        
            let cloudIngredient:Ingredient = self.ingredient
        
        else
        {
            return
        }
        
        buildIngredient.cloudId = cloudIngredient.identifier
        buildIngredient.name = cloudIngredient.name
        buildIngredient.build = self.build
        
        database.save
        { [weak self] in
            
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
