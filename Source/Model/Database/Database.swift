import Foundation
import CoreData

final class Database
{
    let provider:DatabaseProviderProtocol
    
    init(provider:DatabaseProviderProtocol = DatabaseProviderCoreData())
    {
        self.provider = provider
    }
    
    //MARK: internal
    
    func save(completion:@escaping(() -> ()))
    {
        self.provider.save(completion:completion)
    }
    
    func save()
    {
        self.provider.save(completion:nil)
    }
}
