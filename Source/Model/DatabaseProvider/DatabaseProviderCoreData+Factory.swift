import Foundation
import CoreData

extension DatabaseProviderCoreData
{
    //MARK: private
    
    private class func factoryModel() -> NSManagedObjectModel?
    {
        guard
            
            let modelURL:URL = Bundle.main.url(
                forResource:DatabaseProviderCoreData.Constants.modelName,
                withExtension:DatabaseProviderCoreData.Constants.modelExtension),
            let managedObjectModel:NSManagedObjectModel = NSManagedObjectModel(contentsOf:modelURL)
            
        else
        {
            return nil
        }
        
        return managedObjectModel
    }
    
    private class func factoryCoordinator(
        bundle:Bundle,
        managedObjectModel:NSManagedObjectModel) -> NSPersistentStoreCoordinator?
    {
        let url:URL = DatabaseProviderCoreData.factoryCoordinatorURL(bundle:bundle)
        let persistentStoreCoordinator:NSPersistentStoreCoordinator = NSPersistentStoreCoordinator(
            managedObjectModel:managedObjectModel)
        
        do
        {
            try persistentStoreCoordinator.addPersistentStore(
                ofType:NSSQLiteStoreType,
                configurationName:nil,
                at:url,
                options:nil)
        }
        catch
        {
            return nil
        }
        
        return persistentStoreCoordinator
    }
    
    private class func factoryCoordinatorURL(bundle:Bundle) -> URL
    {
        let bundleIdentifier:String
        
        if let identifier:String = bundle.bundleIdentifier
        {
            bundleIdentifier = identifier
        }
        else
        {
            bundleIdentifier = String()
        }
        
        var sqliteFile:String = bundleIdentifier
        sqliteFile.append(".")
        sqliteFile.append(DatabaseProviderCoreData.Constants.modelName)
        sqliteFile.append(".")
        sqliteFile.append(DatabaseProviderCoreData.Constants.sQLiteExtension)
        
        let url:URL = FileManager.default.appDirectory.appendingPathComponent(sqliteFile)
        
        return url
    }
    
    //MARK: internal
    
    class func factoryContext(bundle:Bundle) -> NSManagedObjectContext?
    {
        guard
            
            let managedObjectModel:NSManagedObjectModel = DatabaseProviderCoreData.factoryModel(),
            let persistentStoreCoordinator:NSPersistentStoreCoordinator = DatabaseProviderCoreData.factoryCoordinator(
                bundle:bundle,
                managedObjectModel:managedObjectModel)
            
        else
        {
            return nil
        }
        
        let managedObjectContext:NSManagedObjectContext = NSManagedObjectContext(
            concurrencyType:NSManagedObjectContextConcurrencyType.privateQueueConcurrencyType)
        managedObjectContext.persistentStoreCoordinator = persistentStoreCoordinator
        managedObjectContext.mergePolicy = NSMergePolicy(
            merge:NSMergePolicyType.mergeByPropertyStoreTrumpMergePolicyType)
        
        return managedObjectContext
    }
    
    class func factoryFetchRequest(
        entityName:String,
        limit:Int,
        predicate:NSPredicate?,
        sorters:[NSSortDescriptor]?) -> NSFetchRequest<NSManagedObject>
    {
        let fetchRequest:NSFetchRequest<NSManagedObject> = NSFetchRequest(entityName:entityName)
        fetchRequest.predicate = predicate
        fetchRequest.sortDescriptors = sorters
        fetchRequest.fetchLimit = limit
        fetchRequest.returnsObjectsAsFaults = false
        fetchRequest.includesPropertyValues = true
        fetchRequest.includesSubentities = true
        
        return fetchRequest
    }
}
