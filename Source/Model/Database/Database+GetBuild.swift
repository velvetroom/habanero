import Foundation

extension Database
{
    //MARK: internal
    
    func getBuilds(completion:@escaping(([Build]) -> ()))
    {
        self.provider.get(completion:completion)
    }
}
