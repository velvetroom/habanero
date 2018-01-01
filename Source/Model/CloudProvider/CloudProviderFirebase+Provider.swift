import Foundation

extension CloudProviderFirebase
{
    //MARK: Cloud provider delegate
 
    func createItemAt(
        entity:CloudEntityProtocol,
        width json:[String:Any],
        completion:@escaping((String?, Error?) -> ()))
    {
        self.createDocumentAt(
            collectionPath:entity.path,
            with:json,
            completion:completion)
    }
    
    func loadList<T:CloudListProtocol>(
        identifier:String,
        completion:@escaping((T?, Error?) -> ()))
    {
        
    }
    
    func loadList<T:CloudListProtocol>(
        identifier:String,
        of entity:CloudEntityProtocol,
        completion:@escaping((T?, Error?) -> ()))
    {
        
    }
    
    func loadItem<T:CloudItemProtocol>(
        identifier:String,
        of entity:CloudEntityProtocol,
        completion:@escaping((T?, Error?) -> ()))
    {
        
    }
}
