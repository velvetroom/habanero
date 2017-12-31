import Foundation

protocol CloudItemProtocol
{
    var identifier:String { get }
    var parentPath:String { get }
    var path:String { get }
    var json:[String:Any] { get }
    
    init?(
        parentPath:String,
        identifier:String,
        json:[String:Any])
}
