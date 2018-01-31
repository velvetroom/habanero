import Foundation

final class Analytics
{
    let provider:AnalyticsProviderProtocol
    
    init(provider:AnalyticsProviderProtocol = AnalyticsProviderFirebase())
    {
        self.provider = provider
    }
    
    //MARK: internal
    
    func start()
    {
        self.provider.start()
    }
    
    func setScreen<A>(controller:Controller<A>)
    {
        self.provider.setScreen(controller:controller)
    }
    
    func favouriteRecipe(recipe:Recipe)
    {
        self.provider.favouriteRecipe(recipe:recipe)
    }
    
    func unfavouriteRecipe(recipe:Recipe)
    {
        self.provider.unfavouriteRecipe(recipe:recipe)
    }
}
