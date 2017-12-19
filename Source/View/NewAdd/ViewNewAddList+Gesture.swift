import UIKit

extension ViewNewAddList
{
    private var gestureRouters:[UIGestureRecognizerState:((UILongPressGestureRecognizer) -> ())]
    {
        get
        {
            let map:[UIGestureRecognizerState:((UILongPressGestureRecognizer) -> ())] = [
                UIGestureRecognizerState.began : self.gestureStateBegan,
                UIGestureRecognizerState.possible : self.gestureStateBegan,
                UIGestureRecognizerState.changed : self.gestureStateChanged,
                UIGestureRecognizerState.cancelled : self.gestureStateEnded,
                UIGestureRecognizerState.ended : self.gestureStateEnded,
                UIGestureRecognizerState.failed : self.gestureStateEnded]
            
            return map
        }
    }
    
    //MARK: private
    
    private func gestureStateBegan(gesture:UILongPressGestureRecognizer)
    {
        
    }
    
    private func gestureStateChanged(gesture:UILongPressGestureRecognizer)
    {
        
    }
    
    private func gestureStateEnded(gesture:UILongPressGestureRecognizer)
    {
        
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
}
