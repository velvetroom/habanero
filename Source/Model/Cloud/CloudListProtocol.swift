import Foundation

protocol CloudListProtocol
{
    associatedtype Item:CloudProtocol
    var items:[Item] { get set }
    
    init()
}
