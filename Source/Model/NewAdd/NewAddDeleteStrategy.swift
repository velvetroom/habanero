import Foundation

protocol NewAddDeleteStrategy
{
    func delete(build:Build, completion:@escaping(() -> ()))
}
