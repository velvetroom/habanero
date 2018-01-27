import Foundation

extension Database
{
    //MARK: internal
    
    func createBuild(completion:@escaping((Build) -> ()))
    {
        self.provider.create
        { [weak self] (build:Build) in
            
            self?.provider.save
            {
                completion(build)
            }
        }
    }
}
