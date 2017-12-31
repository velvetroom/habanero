import Foundation

protocol CloudSerialisableProtocol
{
    var json:[String:Any] { get }
    
    static func factoryJson(item:Self) -> [String:Any]
}
