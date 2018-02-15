import Foundation

protocol HomeFilterShowProtocol
{
    var toggleFilter:((ControllerHome) -> (ViewHomeFilterListCellShow) -> ()) { get }
    
    func filter(items:[CookItem]) -> [CookItem]
}
