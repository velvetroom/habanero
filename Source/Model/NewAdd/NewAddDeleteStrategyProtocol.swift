import Foundation

protocol NewAddDeleteStrategyProtocol
{
    func delete(
        build:Build,
        database:Database,
        completion:@escaping(() -> ()))
}
