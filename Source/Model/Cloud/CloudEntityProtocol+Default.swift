import Foundation

extension CloudEntityProtocol
{
    var path:String
    {
        get
        {
            let path:String = self.parentPath.appendingPathComponent(component:self.identifier)
            
            return path
        }
    }
}
