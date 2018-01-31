import Foundation

final class Analytics
{
    let provider:AnalyticsProviderProtocol
    
    init(provider:AnalyticsProviderProtocol = AnalyticsProviderFirebase())
    {
        self.provider = provider
    }
    
    //MARK: internal
    
    
}
