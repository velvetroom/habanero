import Foundation
import Firebase

final class AnalyticsProviderFirebase:AnalyticsProviderProtocol
{
    func startFirebase()
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
    
    func setScreen(screenName:String)
    {
        Firebase.Analytics.setScreenName(screenName, screenClass:screenName)
    }
    
    func logEvent(
        eventName:String,
        parameters:[String:Any])
    {
        Firebase.Analytics.logEvent(
            eventName,
            parameters:parameters)
    }
}
