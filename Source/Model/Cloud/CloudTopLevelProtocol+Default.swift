import Foundation

extension CloudTopLevelProtocol
{
    static var identifier:String
    {
        get
        {
            let stringName:String = String(describing:CloudTopLevelProtocol.self)
            
            return stringName
        }
    }
}
