import Foundation

protocol NewAddDeleteStrategy
{
    func delete(
        build:Build,
        database:Database,
        completion:@escaping(() -> ()))
}
