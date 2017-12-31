import Foundation

extension CloudProviderFirebase
{
    //MARK: Cloud provider delegate
 
    func createItemAt(
        topLevel:CloudTopLevelProtocol.Type,
        width json:[String:Any],
        completion:@escaping((String?, Error?) -> ()))
    {
        self.createDocumentAt(
            collectionPath:topLevel.identifier,
            with:json,
            completion:completion)
    }
    
    func createItemAt(
        list:String,
        of item:CloudItemProtocol,
        width json:[String:Any],
        completion:@escaping((String?, Error?) -> ()))
    {
        var collectionPath:String = item.identifier
        collectionPath.append("/")
        collectionPath.append(list)
        
        self.createDocumentAt(
            collectionPath:collectionPath,
            with:json,
            completion:completion)
    }
}
