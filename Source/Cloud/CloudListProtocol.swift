import Foundation

protocol CloudListProtocol:CloudProtocol
{
    var parent:CloudProtocol? { get }
    
    init?(
        parent:CloudProtocol?,
        json:[String:Any])
}
