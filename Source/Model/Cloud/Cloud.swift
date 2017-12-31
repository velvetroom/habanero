import Foundation

final class Cloud
{
    private let provider:CloudProviderProtocol
    
    init(provider:CloudProviderProtocol = CloudProviderFirebase())
    {
        self.provider = provider
    }
}
