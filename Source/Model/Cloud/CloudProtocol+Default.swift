import Foundation

extension CloudProtocol
{
    var path:String
    {
        get
        {
            var path:String = String()
            path.append(self.parentPath)
            path.append("/")
            path.append(self.identifier)
            
            return path
        }
    }
}