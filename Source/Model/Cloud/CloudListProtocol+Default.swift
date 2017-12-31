import Foundation

extension CloudListProtocol
{
    var identifier:String
    {
        get
        {
            let identifier:String = String(describing:self)
            
            return identifier
        }
    }
    
    var parentPath:String
    {
        get
        {
            let path:String = String()
            
            return path
        }
    }
}
