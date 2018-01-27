import Foundation

extension Database
{
    //MARK: internal
    
    func save(completion:@escaping(() -> ()))
    {
        self.provider.save(completion:completion)
    }
    
    func save()
    {
        self.provider.save(completion:nil)
    }
}
