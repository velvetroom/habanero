import Foundation

final class Menu
{
    var selected:Menu.Order
    let items:[MenuItemProtocol]
    private let itemsMap:[Menu.Order:MenuItemProtocol]
    
    var selectedItem:MenuItemProtocol?
    {
        get
        {
            let selected:MenuItemProtocol? = itemsMap[self.selected]
            
            return selected
        }
    }
    
    init()
    {
        selected = Menu.Constants.initialSelected
        items = Menu.factoryItems()
        itemsMap = Menu.factoryItemsMap(items:items)
    }
}
