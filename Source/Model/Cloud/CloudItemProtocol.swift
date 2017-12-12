import Foundation

protocol CloudItemProtocol:CloudProtocol
{
    var parent:CloudProtocol { get }
    
    init?(
        parent:CloudProtocol,
        identifier:String,
        json:[String:Any])
}
