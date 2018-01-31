import Foundation

extension AnalyticsProviderFirebase
{
    //MARK: private
    
    private func parametersForRecipe(recipe:Recipe) -> [String:Any]
    {
        let parameters:[String:Any] = [
            AnalyticsProviderFirebase.Constants.paramenterRecipeID : recipe.identifier]
        
        return parameters
    }
    
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
    
    func favouriteRecipe(recipe:Recipe)
    {
        let parameters:[String:Any] = self.parametersForRecipe(recipe:recipe)
        
        self.logEvent(
            eventName:AnalyticsProviderFirebase.Constants.eventFavourite,
            parameters:parameters)
    }
    
    func unfavouriteRecipe(recipe:Recipe)
    {
        let parameters:[String:Any] = self.parametersForRecipe(recipe:recipe)
        
        self.logEvent(
            eventName:AnalyticsProviderFirebase.Constants.eventUnfavourite,
            parameters:parameters)
    }
}
