import Foundation

protocol NewAddDeleteStrategyProtocol
{
    static func delete(
        build:Build,
        database:Database,
        completion:@escaping(() -> ()))
}
