import Foundation

final class Storage
{
    let provider:StorageProviderProtocol
    
    init(provider:StorageProviderProtocol = StorageProviderFirebase())
    {
        self.provider = provider
    }
}
