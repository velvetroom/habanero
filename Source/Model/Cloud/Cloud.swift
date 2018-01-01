import Foundation

final class Cloud
{
    let provider:CloudProviderProtocol
    
    init(provider:CloudProviderProtocol = CloudProviderFirebase())
    {
        self.provider = provider
    }
}
