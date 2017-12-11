import Foundation

protocol CloudItemProtocol:CloudProtocol
{
    init?(
        parent:CloudProtocol,
        identifier:String,
        json:Any)
}
