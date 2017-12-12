import Foundation

protocol CloudProtocol
{
    var identifier:String { get }
    var path:String { get }
    var json:[String:Any] { get }
}
