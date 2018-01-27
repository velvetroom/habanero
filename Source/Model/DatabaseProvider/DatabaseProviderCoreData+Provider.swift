import Foundation
import CoreData

extension DatabaseProviderCoreData
{
    //MARK: internal
    
    func save(completion:(() -> ())?)
    {
        self.saveIfNeeded(completion:completion)
    }
    
    func create<T>(completion:@escaping((T) -> ()))
    {
        guard
            
            let completion:((NSManagedObject) -> ()) = completion as? ((NSManagedObject) -> ())
        
        else
        {
            return
        }
        
        self.createObject(completion:completion)
    }
    
    func get<T>(completion:@escaping(([T]) -> ()))
    {
        guard
            
            let completion:(([NSManagedObject]) -> ()) = completion as? (([NSManagedObject]) -> ())
            
        else
        {
            return
        }
        
        self.fetchObjects(
            limit:0,
            predicate:nil,
            sorters:nil,
            completion:completion)
    }
    
    func delete(
        model:AnyObject,
        completion:(() -> ())?)
    {
        guard
        
            let model:NSManagedObject = model as? NSManagedObject
        
        else
        {
            return
        }
        
        self.deleteObject(
            object:model,
            completion:completion)
    }
}
