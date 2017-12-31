import Foundation

protocol CloudItemProtocol
{
    var identifier:String { get }
    var parent:CloudItemProtocol? { get }
    
    init?(
        identifier:String,
        json:[String:Any])
}
