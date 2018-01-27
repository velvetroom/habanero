import Foundation

extension NewAddIngredientAmount
{
    //MARK: private
    
    private func asyncCreateIngredient(
        amount:String,
        completion:@escaping(() -> ()))
    {
        guard
        
            let type:NewAddIngredientAmountTypeProtocol = self.selectedType,
            let database:Database = self.database
        
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
                completion:completion)
        }
    }
    
    private func configureIngredient(
        buildIngredient:BuildIngredient,
        completion:@escaping(() -> ()))
    {
        guard
        
            let cloudIngredient:Ingredient = self.ingredient
        
        else
        {
            return
        }
        
        buildIngredient.ingredientIdentifier = cloudIngredient.identifier
        buildIngredient.name = cloudIngredient.name
        buildIngredient.build = self.build
        
        self.database?.save
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
