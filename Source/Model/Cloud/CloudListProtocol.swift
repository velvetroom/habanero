import Foundation

protocol CloudListProtocol:CloudEntityProtocol
{
    associatedtype Item:CloudItemProtocol
    var items:[Item] { get set }
    
    init(parentPath:String)
    
    static func factoryItem(
        identifier:String,
        parentPath:String,
        json:[String:Any]) -> Item?
}
