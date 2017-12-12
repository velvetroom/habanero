import Foundation

extension CloudListProtocol
{
    static var identifier:String
    {
        get
        {
            let stringName:String = String(describing:self)
            
            return stringName
        }
    }
}
