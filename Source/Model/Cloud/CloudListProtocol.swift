import Foundation

protocol CloudListProtocol
{
    associatedtype Item:CloudItemProtocol
    var items:[Item] { get set }
    
    init()
}
