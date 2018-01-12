import Foundation

extension CloudListProtocol
{
    static var identifier:String
    {
        get
        {
            let identifier:String = String(describing:self)
            
            return identifier
        }
    }
    
    var identifier:String
    {
        get
        {
            let listType:Self.Type = type(of:self)

            return listType.identifier
        }
    }
    
    static func factoryItem(
        identifier:String,
        parentPath:String,
        json:[String:Any]) -> Item?
    {
        let item:Item? = Item(
            identifier:identifier,
            parentPath:parentPath,
            json:json)
        
        return item
    }
}
