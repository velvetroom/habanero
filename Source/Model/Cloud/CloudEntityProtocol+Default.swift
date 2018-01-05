import Foundation

extension CloudEntityProtocol
{
    var path:String
    {
        get
        {
            guard
                
                self.parentPath.isEmpty == false
            
            else
            {
                return self.identifier
            }
            
            let path:String = self.parentPath.appendingPathComponent(component:self.identifier)
            
            return path
        }
    }
}
