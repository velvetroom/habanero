import Foundation

extension Database
{
    //MARK: internal
    
    func deleteBuild(
        build:Build,
        completion:@escaping(() -> ()))
    {
        self.provider.delete(model:build)
        { [weak self] in
            
            self?.provider.save(completion:completion)
        }
    }
}
