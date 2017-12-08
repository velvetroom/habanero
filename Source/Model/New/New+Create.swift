import Foundation

extension New
{
    //MARK: private
    
    private func asyncCreateBuild(completion:@escaping((Build) -> ()))
    {
        self.database?.create
        { [weak self] (build:Build) in
            
            self?.database?.save
            {
                completion(build)
            }
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
