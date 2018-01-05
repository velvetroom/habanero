import Foundation

protocol CloudProviderProtocol
{
    func createItemAt(
        listType:CloudListProtocol.Type,
        with json:[String:Any],
        completion:@escaping((String?, Error?) -> ()))
    
    func createItemAt(
        listKey:String,
        of item:CloudItemProtocol,
        with json:[String:Any],
        completion:@escaping((String?, Error?) -> ()))
    
    func createItemAt(
        list:CloudListProtocol,
        with json:[String:Any],
        completion:@escaping((String?, Error?) -> ()))
    
    func loadList<T:CloudListProtocol>(completion:@escaping((T?, Error?) -> ()))
    
    func loadList<T:CloudListProtocol>(
        listKey:String,
        of item:CloudItemProtocol,
        completion:@escaping((T?, Error?) -> ()))
    
    func loadItem<T:CloudItemProtocol>(
        identifier:String,
        of entity:CloudEntityProtocol,
        completion:@escaping((T?, Error?) -> ()))
}
