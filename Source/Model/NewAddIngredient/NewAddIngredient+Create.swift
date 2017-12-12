import Foundation

extension NewAddIngredient
{
    //MARK: private
    
    func asynCreateIngredient(completion:@escaping(() -> ()))
    {
        let nameLength:Int = self.searching.count
        
        guard
        
            nameLength > 0
        
        else
        {
            return
        }
        
        let ingredientData:[String:Any] = 
        
        self.cloud.create(parent: <#T##CloudProtocol#>, data: <#T##[String : Any]#>, completion: <#T##((String?, Error?) -> ())##((String?, Error?) -> ())##(String?, Error?) -> ()#>)
    }
    
    //MARK: internal
    
    func createIngredient(completion:@escaping(() -> ()))
    {
        DispatchQueue.global(qos:DispatchQoS.QoSClass.background).async
        { [weak self] in
            
            self?.asynCreateIngredient(completion:completion)
        }
    }
}
