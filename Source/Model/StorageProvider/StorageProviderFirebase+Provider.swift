import Foundation

extension StorageProviderFirebase
{
    //MARK: Storage provider delegate
    
    func save(
        data:Data,
        with identifier:String,
        at container:StorageContainer,
        completion:@escaping((Error?) -> ()))
    {
        let path:String = container.rawValue.appendingPathComponent(component:identifier)
        
        self.saveData(
            data:data,
            at:path,
            completion:completion)
    }
    
    func save(
        data:Data,
        with identifier:String,
        at parentIdentifier:String,
        of container:StorageContainer,
        completion:@escaping((Error?) -> ()))
    {
        let parentPath:String = container.rawValue.appendingPathComponent(component:parentIdentifier)
        let path:String = parentPath.appendingPathComponent(component:identifier)
        
        self.saveData(
            data:data,
            at:path,
            completion:completion)
    }
    
    func load(
        identifier:String,
        at container:StorageContainer,
        completion:@escaping((Data?, Error?) -> ()))
    {
        let path:String = container.rawValue.appendingPathComponent(component:identifier)
        
        self.loadData(
            path:path,
            completion:completion)
    }
    
    func load(
        identifier:String,
        at parentIdentifier:String,
        of container:StorageContainer,
        completion:@escaping((Data?, Error?) -> ()))
    {
        let parentPath:String = container.rawValue.appendingPathComponent(component:parentIdentifier)
        let path:String = parentPath.appendingPathComponent(component:identifier)
        
        self.loadData(
            path:path,
            completion:completion)
    }
}
