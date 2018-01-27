import Foundation
import CoreData

final class DatabaseProviderCoreData:DatabaseProviderProtocol
{
    let managedObjectContext:NSManagedObjectContext?
    
    init(bundle:Bundle)
    {
        self.managedObjectContext = Database.factoryContext(bundle:bundle)
    }
    
    //MARK: internal
    
    func save(completion:(() -> ())?)
    {
        if self.managedObjectContext.hasChanges
        {
            self.managedObjectContext.perform
                {
                    do
                    {
                        try self.managedObjectContext.save()
                    }
                    catch let error
                    {
                        assertionFailure(error.localizedDescription)
                        
                        return
                    }
                    
                    completion?()
            }
        }
        else
        {
            completion?()
        }
    }
    
    func create<T:NSManagedObject>(completion:@escaping((T) -> ()))
    {
        self.managedObjectContext.perform
            {
                guard
                    
                    let entityDescription:NSEntityDescription = NSEntityDescription.entity(
                        forEntityName:T.entityName,
                        in:self.managedObjectContext),
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
        let fetchRequest:NSFetchRequest<NSManagedObject> = Database.factoryFetchRequest(
            entityName:T.entityName,
            limit:limit,
            predicate:predicate,
            sorters:sorters)
        
        self.managedObjectContext.perform
            {
                let data:[NSManagedObject]
                
                do
                {
                    data = try self.managedObjectContext.fetch(fetchRequest)
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
        self.managedObjectContext.perform
            {
                self.managedObjectContext.delete(data)
                completion?()
        }
    }
}
