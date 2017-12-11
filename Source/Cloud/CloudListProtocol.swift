import Foundation

protocol CloudListProtocol:CloudProtocol
{
    init?(
        parent:CloudProtocol?,
        json:Any)
}
