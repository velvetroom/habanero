import Foundation

protocol StorageProviderProtocol
{
    func save(
        data:Data,
        with identifier:String,
        at container:StorageContainer,
        completion:@escaping((Error?) -> ()))
    
    func save(
        data:Data,
        with identifier:String,
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
