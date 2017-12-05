import Foundation

class Model<A:Arch>
{
    weak var view:A.V?
    
    required init() { }
}
