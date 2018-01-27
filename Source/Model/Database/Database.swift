import Foundation
import CoreData

final class Database
{
    let provider:DatabaseProviderProtocol
    
    init(provider:DatabaseProviderProtocol = DatabaseProviderCoreData())
    {
        self.provider = provider
    }
}
