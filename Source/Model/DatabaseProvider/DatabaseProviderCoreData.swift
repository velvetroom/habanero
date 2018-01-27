import Foundation
import CoreData

final class DatabaseProviderCoreData:DatabaseProviderProtocol
{
    let managedObjectContext:NSManagedObjectContext?
    
    init(bundle:Bundle = Bundle.main)
    {
        self.managedObjectContext = DatabaseProviderCoreData.factoryContext(bundle:bundle)
    }
    
    //MARK: internal
    
    func saveIfNeeded(completion:(() -> ())?)
    {
        guard
        
            let hasChanges:Bool = self.managedObjectContext?.hasChanges,
            hasChanges == true
        
        else
        {
            completion?()
            
            return
        }
        
        self.managedObjectContext?.perform
        {
            do
            {
                try self.managedObjectContext?.save()
            }
            catch let error
            {
                assertionFailure(error.localizedDescription)
                
                return
            }
            
            completion?()
        }
    }
    
    func createObject<T>(completion:@escaping((T) -> ()))
    {
        self.managedObjectContext?.perform
        {
            guard
                
                let objectType:NSManagedObject.Type = T.self as? NSManagedObject.Type,
                let managedObjectContext:NSManagedObjectContext = self.managedObjectContext,
                let entityDescription:NSEntityDescription = NSEntityDescription.entity(
                    forEntityName:objectType.entityName,
                    in:managedObjectContext),
                let managedObject:T = NSManagedObject(
                    entity:entityDescription,
                    insertInto:self.managedObjectContext) as? T
                
            else
            {
                return
            }
            
            completion(managedObject)
        }
    }
    
    func fetchObjects<T>(
        limit:Int,
        predicate:NSPredicate?,
        sorters:[NSSortDescriptor]?,
        completion:@escaping(([T]) -> ()))
    {
        guard
            
            let objectType:NSManagedObject.Type = T.self as? NSManagedObject.Type
        
        else
        {
            return
        }
        
        let fetchRequest:NSFetchRequest<NSManagedObject> = DatabaseProviderCoreData.factoryFetchRequest(
            entityName:objectType.entityName,
            limit:limit,
            predicate:predicate,
            sorters:sorters)
        
        self.managedObjectContext?.perform
        {
            let data:[NSManagedObject]?
            
            do
            {
                data = try self.managedObjectContext?.fetch(fetchRequest)
            }
            catch
            {
                return
            }
            
            guard
                
                let results:[T] = data as? [T]
                
            else
            {
                return
            }
            
            completion(results)
        }
    }
    
    func deleteObject(
        object:NSManagedObject,
        completion:(() -> ())?)
    {
        self.managedObjectContext?.perform
        {
            self.managedObjectContext?.delete(object)
            completion?()
        }
    }
}
