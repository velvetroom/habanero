import Foundation

protocol StorageProviderProtocol
{
    func save(
        data:Data,
        at container:StorageContainer,
        completion:@escaping((Error?) -> ()))
    
    func save(
        data:Data,
        at parentIdentifier:String,
        of container:StorageContainer,
        completion:@escaping((Error?) -> ()))
    
    func load(
        identifier:String,
        at container:StorageContainer,
        completion:@escaping((Data?, Error?) -> ()))
    
    func load(
        identifier:String,
        at parentIdentifier:String,
        of container:StorageContainer,
        completion:@escaping((Data?, Error?) -> ()))
}
