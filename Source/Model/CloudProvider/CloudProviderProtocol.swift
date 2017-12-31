import Foundation

protocol CloudProviderProtocol
{
    func createItemAt(
        list:CloudListProtocol.Type,
        width json:[String:Any],
        completion:@escaping((String?, Error?) -> ()))
    
    func createItemAt(
        list:String,
        of item:CloudItemProtocol,
        width json:[String:Any],
        completion:@escaping((String?, Error?) -> ()))
}
