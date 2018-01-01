import Foundation

extension CloudEntityProtocol
{
    var path:String
    {
        get
        {
            var path:String = self.parentPath
            path.append(self.identifier)
            
            return path
        }
    }
}
