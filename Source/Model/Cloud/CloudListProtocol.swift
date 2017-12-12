import Foundation

protocol CloudListProtocol:CloudProtocol
{
    init?(
        parentPath:String,
        json:[String:Any])
}
