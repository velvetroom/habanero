import UIKit

extension NewAdd
{
    //MARK: private
    
    private func asyncMoveStepFrom(
        origin:IndexPath,
        to destination:IndexPath,
        completion:@escaping(() -> ()))
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
        
        self.moveCompleted(completion:completion)
    }
    
    private func moveCompleted(completion:@escaping(() -> ()))
    {
        self.database?.save
        {
            DispatchQueue.main.async
            {
                completion()
            }
        }
    }
    
    //MARK: internal
    
    func moveStepFrom(
        origin:IndexPath,
        to destination:IndexPath,
        completion:@escaping(() -> ()))
    {
        DispatchQueue.global(qos:DispatchQoS.QoSClass.background).async
        { [weak self] in
            
            self?.asyncMoveStepFrom(
                origin:origin,
                to:destination,
                completion:completion)
        }
    }
    
    func saveMovingCellDelta(
        gestureLocation:CGPoint,
        cellLocation:CGPoint)
    {
        self.movingCellDelta = CGPoint(
            x:cellLocation.x - gestureLocation.x,
            y:cellLocation.y - gestureLocation.y)
    }
    
    func updatedCellLocation(gestureLocation:CGPoint) -> CGPoint?
    {
        guard
        
            let movingCellDelta:CGPoint = self.movingCellDelta
        
        else
        {
            return nil
        }
        
        let cellLocation:CGPoint = CGPoint(
            x:gestureLocation.x + movingCellDelta.x,
            y:gestureLocation.y + movingCellDelta.y)
        
        return cellLocation
    }
}
