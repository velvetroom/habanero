import Foundation

extension CloudListProtocol
{
    static var identifier:String
    {
        get
        {
            let identifier:String = String(describing:self)
            
            return identifier
        }
    }
    
    var identifier:String
    {
        get
        {
            let identifier:String = String(describing:self)
            
            return identifier
        }
    }
}
