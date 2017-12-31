import Foundation

protocol CloudProviderProtocol
{
    func createItemAt(
        topLevel:CloudTopLevelProtocol.Type,
        width json:[String:Any],
        completion:@escaping((String?, Error?) -> ()))
    
    func createItemAt(
        list:String,
        of item:CloudItemProtocol,
        width json:[String:Any],
        completion:@escaping((String?, Error?) -> ()))
    
    func loadList<T:CloudListProtocol>(
        parentPath:String,
        completion:@escaping((T?, Error?) -> ()))
    
    func loadItem<T:CloudItemProtocol>(
        identifier:String,
        at parentPath:String,
        completion:@escaping((T?, Error?) -> ()))
}
