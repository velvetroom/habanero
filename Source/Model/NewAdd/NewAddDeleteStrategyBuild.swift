import Foundation

struct NewAddDeleteStrategyBuild:NewAddDeleteStrategyProtocol
{
    //MARK: internal
    
    static func delete(
        build:Build,
        database:Database,
        completion:@escaping(() -> ()))
    {
        database.deleteBuild(
            build:build,
            completion:completion)
    }
}
