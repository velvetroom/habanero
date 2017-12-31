import Foundation

extension CloudTopLevelProtocol
{
    static var identifier:String
    {
        get
        {
            let stringName:String = String(describing:CloudListTopLevelProtocol.self)
            
            return stringName
        }
    }
}
