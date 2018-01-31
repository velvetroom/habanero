import Foundation

protocol AnalyticsProviderProtocol
{
    func start()
    func setScreen<A>(controller:Controller<A>)
    func favouriteRecipe(recipe:Recipe)
    func unfavouriteRecipe(recipe:Recipe)
}
