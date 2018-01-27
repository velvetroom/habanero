import Foundation

extension Database
{
    //MARK: internal
    
    func getSettings(completion:@escaping((Settings?) -> ()))
    {
        self.provider.get
        { (settingsList:[Settings]) in
            
            let settings:Settings? = settingsList.first
            completion(settings)
        }
    }
}
