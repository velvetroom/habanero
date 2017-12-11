import Foundation

extension CloudListProtocol
{
    //MARK: internal
    
    func factoryItemPath(identifier:String) -> String
    {
        var path:String = self.path
        path.append("/")
        path.append(identifier)
        
        return path
    }
}
