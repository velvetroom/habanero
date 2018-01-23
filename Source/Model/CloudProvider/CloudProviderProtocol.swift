import Foundation

protocol CloudProviderProtocol
{
    func createItemAt<T:CloudListProtocol>(
        listType:T.Type,
        with json:[String:Any],
        completion:@escaping((String?, Error?) -> ()))
    
    func createItemAt(
        listKey:String,
        of item:CloudItemProtocol,
        with json:[String:Any],
        completion:@escaping((String?, Error?) -> ()))
    
    func createItemAt<T:CloudListProtocol>(
        list:T,
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
    
    func loadItem<T:CloudItemProtocol>(
        identifier:String,
        at listKey:String,
        of parentItem:CloudItemProtocol,
        completion:@escaping((T?, Error?) -> ()))
    
    func transactionIncrease(
        listKey:String,
        of item:CloudItemProtocol,
        completion:@escaping((Error?) -> ()))
    
    func transactionDecrease(
        listKey:String,
        of item:CloudItemProtocol,
        completion:@escaping((Error?) -> ()))
}
