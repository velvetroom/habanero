import Foundation

protocol CloudProviderProtocol
{
    func createItemAt(
        entity:CloudEntityProtocol,
        width json:[String:Any],
        completion:@escaping((String?, Error?) -> ()))
    
    func loadList<T:CloudListProtocol>(
        identifier:String,
        completion:@escaping((T?, Error?) -> ()))
    
    func loadList<T:CloudListProtocol>(
        identifier:String,
        of entity:CloudEntityProtocol,
        completion:@escaping((T?, Error?) -> ()))
    
    func loadItem<T:CloudItemProtocol>(
        identifier:String,
        of entity:CloudEntityProtocol,
        completion:@escaping((T?, Error?) -> ()))
}
