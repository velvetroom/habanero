import Foundation

protocol CloudItemProtocol:CloudProtocol
{
    init?(
        identifier:String,
        json:Any)
}
