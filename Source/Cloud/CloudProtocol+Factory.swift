import Foundation

extension CloudProtocol
{
    //MARK: internal
    
    func factoryPath(identifier:String) -> String
    {
        var path:String = self.path
        path.append("/")
        path.append(identifier)
        
        return path
    }
}
