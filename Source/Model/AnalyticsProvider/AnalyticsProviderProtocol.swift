import Foundation

protocol AnalyticsProviderProtocol
{
    func start()
    func setScreen<A>(controller:Controller<A>)
}
