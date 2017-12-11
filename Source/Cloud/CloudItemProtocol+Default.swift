import Foundation

extension CloudItemProtocol
{
    var path:String
    {
        get
        {
            var path:String = String()
            path.append(self.parent.path)
            path.append("/")
            path.append(self.identifier)
            
            return path
        }
    }
}
