import Foundation

protocol CloudItemProtocol:CloudProtocol
{
    init?(
        parentPath:String,
        identifier:String,
        json:[String:Any])
}
