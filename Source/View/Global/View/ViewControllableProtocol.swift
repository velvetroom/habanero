import UIKit

protocol ViewControllableProtocol
{
    associatedtype A where A.C:Controller<A>
    
    init(controller:Controller<A>)
}
