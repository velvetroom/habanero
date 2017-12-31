import Foundation

protocol CloudListProtocol:CloudEntityProtocol
{
    associatedtype Item:CloudItemProtocol
    var items:[Item] { get set }
    
    init(parentPath:String)
}
