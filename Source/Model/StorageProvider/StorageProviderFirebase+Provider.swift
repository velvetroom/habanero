import Foundation

extension StorageProviderFirebase
{
    //MARK: Storage provider delegate
    
    func save(
        data:Data,
        at container:StorageContainer,
        completion:@escaping((Error?) -> ()))
    {
        self.saveData(
            data:data,
            at:container.rawValue,
            completion:completion)
    }
    
    func save(
        data:Data,
        at parentIdentifier:String,
        of container:StorageContainer,
        completion:@escaping((Error?) -> ()))
    {
        let path:String = container.rawValue.appendingPathComponent(component:parentIdentifier)
        
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
        self.loadData(
            path:container.rawValue,
            completion:completion)
    }
    
    func load(
        identifier:String,
        at parentIdentifier:String,
        of container:StorageContainer,
        completion:@escaping((Data?, Error?) -> ()))
    {
        let path:String = container.rawValue.appendingPathComponent(component:parentIdentifier)
        
        self.loadData(
            path:path,
            completion:completion)
    }
}
