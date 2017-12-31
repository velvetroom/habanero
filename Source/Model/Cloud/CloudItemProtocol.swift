import Foundation

protocol CloudItemProtocol
{
    var identifier:String { get }
    
    init?(
        parentPath:String,
        identifier:String,
        json:[String:Any])
}
