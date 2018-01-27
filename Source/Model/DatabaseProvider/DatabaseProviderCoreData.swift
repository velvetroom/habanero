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
    
    func save(completion:(() -> ())?)
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
    
    func create<T:NSManagedObject>(completion:@escaping((T) -> ()))
    {
        self.managedObjectContext?.perform
        {
            guard
                
                let managedObjectContext:NSManagedObjectContext = self.managedObjectContext,
                let entityDescription:NSEntityDescription = NSEntityDescription.entity(
                    forEntityName:T.entityName,
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
    
    func fetch<T:NSManagedObject>(
        limit:Int = 0,
        predicate:NSPredicate? = nil,
        sorters:[NSSortDescriptor]? = nil,
        completion:@escaping(([T]) -> ()))
    {
        let fetchRequest:NSFetchRequest<NSManagedObject> = DatabaseProviderCoreData.factoryFetchRequest(
            entityName:T.entityName,
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
    
    func delete(data:NSManagedObject, completion:(() -> ())?)
    {
        self.managedObjectContext?.perform
        {
            self.managedObjectContext?.delete(data)
            completion?()
        }
    }
}
