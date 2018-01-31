import Foundation

extension AnalyticsProviderFirebase
{
    //MARK: internal
    
    func start()
    {
        self.startFirebase()
    }
    
    func setScreen<A>(controller:Controller<A>)
    {
        let controllerType:Controller<A>.Type = type(of:controller)
        let controllerName:String = String(describing:controllerType)
        
        self.setScreen(screenName:controllerName)
    }
}
