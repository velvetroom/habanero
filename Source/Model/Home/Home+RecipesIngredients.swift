import Foundation

extension Home
{
    //MARK: private
    
    private func asyncLoadIngredientsFor(item:HomeItem)
    {
        
    }
    
    //MARK: internal
    
    func loadIngredientsFor(item:HomeItem)
    {
        DispatchQueue.global(qos:DispatchQoS.QoSClass.background).async
        { [weak self] in
            
            self?.asyncLoadIngredientsFor(item:item)
        }
    }
}
