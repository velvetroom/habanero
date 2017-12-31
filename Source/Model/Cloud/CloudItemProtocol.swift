import Foundation

protocol CloudItemProtocol:CloudEntityProtocol
{
    init?(
        identifier:String,
        parentPath:String,
        json:[String:Any])
}
