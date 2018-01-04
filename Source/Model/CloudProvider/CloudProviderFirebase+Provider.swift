import Foundation

extension CloudProviderFirebase
{
    //MARK: Cloud provider delegate
 
    func createItemAt(
        entity:CloudEntityProtocol,
        with json:[String:Any],
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
        let parentPath:String = String()
        
        self.loadCollection(
            identifier:identifier,
            parentPath:parentPath,
            completion:completion)
    }
    
    func loadList<T:CloudListProtocol>(
        identifier:String,
        of entity:CloudEntityProtocol,
        completion:@escaping((T?, Error?) -> ()))
    {
        self.loadCollection(
            identifier:identifier,
            parentPath:entity.path,
            completion:completion)
    }
    
    func loadItem<T:CloudItemProtocol>(
        identifier:String,
        of entity:CloudEntityProtocol,
        completion:@escaping((T?, Error?) -> ()))
    {
        self.loadDocument(
            identifier:identifier,
            collectionPath:entity.path,
            completion:completion)
    }
}
