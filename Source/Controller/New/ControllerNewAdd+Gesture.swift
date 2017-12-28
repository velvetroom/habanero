import UIKit

extension ControllerNewAdd
{
    private var gestureRouters:[UIGestureRecognizerState:((UILongPressGestureRecognizer) -> ())]
    {
        get
        {
            let map:[UIGestureRecognizerState:((UILongPressGestureRecognizer) -> ())] = [
                UIGestureRecognizerState.began : self.gestureStateBegan,
                UIGestureRecognizerState.possible : self.gestureStateBegan,
                UIGestureRecognizerState.changed : self.gestureStateChanged,
                UIGestureRecognizerState.ended : self.gestureStateEnded,
                UIGestureRecognizerState.cancelled : self.gestureStateCancelled,
                UIGestureRecognizerState.failed : self.gestureStateCancelled]
            
            return map
        }
    }
    
    //MARK: private
    
    private func gestureStateBegan(gesture:UILongPressGestureRecognizer)
    {
        let location:CGPoint = gesture.location(in:self.collectionView)
        
        guard
            
            let indexPath:IndexPath = self.viewMain.viewList.collectionView.indexPathForItem(at:location)
            
        else
        {
            return
        }
        
        self.viewMain.viewList.collectionView.beginInteractiveMovementForItem(at:indexPath)
    }
    
    private func gestureStateChanged(gesture:UILongPressGestureRecognizer)
    {
        guard
            
            self.isDraggableLocation(gesture:gesture) == true
            
        else
        {
            return
        }
        
        let location:CGPoint = gesture.location(in:self.viewMain.viewList.collectionView)
        self.viewMain.viewList.collectionView.updateInteractiveMovementTargetPosition(location)
    }
    
    private func gestureStateEnded(gesture:UILongPressGestureRecognizer)
    {
        self.viewMain.viewList.collectionView.endInteractiveMovement()
    }
    
    private func gestureStateCancelled(gesture:UILongPressGestureRecognizer)
    {
        self.viewMain.viewList.collectionView.cancelInteractiveMovement()
    }
    
    //MARK: internal
    
    func gestureReceived(gesture:UILongPressGestureRecognizer)
    {
        guard
            
            let router:((UILongPressGestureRecognizer) -> ()) = self.gestureRouters[gesture.state]
            
        else
        {
            return
        }
        
        router(gesture)
    }
    
    func isDraggableLocation(gesture:UIGestureRecognizer) -> Bool
    {
        let location:CGPoint = gesture.location(in:self.viewMain.viewList.collectionView)
        
        guard
            
            let indexPath:IndexPath = self.viewMain.viewList.collectionView.indexPathForItem(at:location),
            let cell:UICollectionViewCell = self.viewMain.viewList.collectionView.cellForItem(at:indexPath),
            cell is ViewNewAddListCellDraggrableProtocol == true
            
        else
        {
            return false
        }
        
        return true
    }
}
