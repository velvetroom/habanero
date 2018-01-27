import Foundation

protocol DatabaseProviderProtocol
{
    func save(completion:(() -> ())?)
    
    func create<T>(completion:@escaping((T) -> ()))
    
    func get<T>(completion:@escaping(([T]) -> ()))
    
    func delete(
        model:AnyObject,
        completion:(() -> ())?)
}
