import Foundation

extension NewAdd
{
    //MARK: internal
    
    func moveStepFrom(origin:IndexPath, to destination:IndexPath)
    {
        guard
        
            let build:Build = self.build,
            let orderedSet:NSMutableOrderedSet = build.steps?.mutableCopy() as? NSMutableOrderedSet
        
        else
        {
            return
        }
        
        orderedSet.exchangeObject(
            at:origin.item,
            withObjectAt:destination.item)
        
        build.steps = orderedSet
        
        DispatchQueue.global(qos:DispatchQoS.QoSClass.background).async
        { [weak self] in
            
            self?.database?.save(completion:nil)
        }
    }
}
