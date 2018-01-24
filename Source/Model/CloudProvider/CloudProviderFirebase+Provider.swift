import Foundation

extension CloudProviderFirebase
{
    //MARK: Cloud provider delegate
 
    func createItemAt<T:CloudListProtocol>(
        listType:T.Type,
        with json:[String:Any],
        completion:@escaping((String?, Error?) -> ()))
    {
        let path:String = listType.identifier
        
        self.createDocumentAt(
            collectionPath:path,
            with:json,
            completion:completion)
    }
    
    func createItemAt(
        listKey:String,
        of item:CloudItemProtocol,
        with json:[String:Any],
        completion:@escaping((String?, Error?) -> ()))
    {
        let path:String = item.path.appendingPathComponent(component:listKey)
        
        self.createDocumentAt(
            collectionPath:path,
            with:json,
            completion:completion)
    }
    
    func createItemAt<T:CloudListProtocol>(
        list:T,
        with json:[String:Any],
        completion:@escaping((String?, Error?) -> ()))
    {
        let path:String = list.identifier
        
        self.createDocumentAt(
            collectionPath:path,
            with:json,
            completion:completion)
    }
    
    func loadList<T:CloudListProtocol>(completion:@escaping((T?, Error?) -> ()))
    {
        let identifier:String = T.identifier
        let parentPath:String = String()
        
        self.loadCollection(
            identifier:identifier,
            parentPath:parentPath,
            completion:completion)
    }
    
    func loadList<T:CloudListProtocol>(
        listKey:String,
        of item:CloudItemProtocol,
        completion:@escaping((T?, Error?) -> ()))
    {
        let identifier:String = listKey
        let parentPath:String = item.path
        
        self.loadCollection(
            identifier:identifier,
            parentPath:parentPath,
            completion:completion)
    }
    
    func loadItem<T:CloudItemProtocol>(
        identifier:String,
        of entity:CloudEntityProtocol,
        completion:@escaping((T?, Error?) -> ()))
    {
        let path:String = entity.path
        
        self.loadDocument(
            identifier:identifier,
            collectionPath:path,
            completion:completion)
    }
    
    func loadItem<T:CloudItemProtocol>(
        identifier:String,
        at listKey:String,
        of parentItem:CloudItemProtocol,
        completion:@escaping((T?, Error?) -> ()))
    {
        let path:String = parentItem.path.appendingPathComponent(component:listKey)
        
        self.loadDocument(
            identifier:identifier,
            collectionPath:path,
            completion:completion)
    }
    
    func increaseProperty(
        property:String,
        of item:CloudItemProtocol,
        completion:@escaping((Error?) -> ()))
    {
        self.transactionOnProperty(
            property:property,
            documentPath:item.path,
            with:CloudProviderFirebase.Constants.increaseDelta,
            completion:completion)
    }
    
    func decreaseProperty(
        property:String,
        of item:CloudItemProtocol,
        completion:@escaping((Error?) -> ()))
    {
        self.transactionOnProperty(
            property:property,
            documentPath:item.path,
            with:CloudProviderFirebase.Constants.decreaseDelta,
            completion:completion)
    }
}
