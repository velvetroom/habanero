import Foundation
import Firebase

final class Analytics
{
    let provider:AnalyticsProviderProtocol
    
    init(provider:AnalyticsProviderProtocol = AnalyticsProviderFirebase())
    {
        self.provider = provider
    }
    
    //MARK: internal
    
    class func start()
    {
        guard
            
            FirebaseApp.app() == nil
        
        else
        {
            return
        }
        
        FirebaseConfiguration.shared.setLoggerLevel(FirebaseLoggerLevel.min)
        FirebaseApp.configure()
    }
    
    class func setScreenView(controller:UIViewController)
    {
        let controllerType:UIViewController.Type = type(of:controller)
        let controllerName:String = String(describing:controllerType)
        Firebase.Analytics.setScreenName(controllerName, screenClass:controllerName)
    }
}
