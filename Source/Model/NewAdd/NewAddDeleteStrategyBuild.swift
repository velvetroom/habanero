import Foundation

struct NewAddDeleteStrategyBuild:NewAddDeleteStrategyProtocol
{
    //MARK: internal
    
    static func delete(
        build:Build,
        database:Database,
        completion:@escaping (() -> ()))
    {
        database.delete(data:build)
        {
            database.save(completion:completion)
        }
    }
}
