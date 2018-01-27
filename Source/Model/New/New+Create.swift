import Foundation

extension New
{
    //MARK: private
    
    private func asyncCreateBuild(completion:@escaping((Build) -> ()))
    {
        self.database.createBuild
        { [weak self] (build:Build) in
            
            self?.buildCreated(
                build:build,
                completion:completion)
        }
    }
    
    private func buildCreated(
        build:Build,
        completion:@escaping((Build) -> ()))
    {
        DispatchQueue.main.async
        {
            completion(build)
        }
    }
    
    //MARK: internal
    
    func createBuild(completion:@escaping((Build) -> ()))
    {
        DispatchQueue.global(qos:DispatchQoS.QoSClass.background).async
        { [weak self] in
            
            self?.asyncCreateBuild(completion:completion)
        }
    }
}
