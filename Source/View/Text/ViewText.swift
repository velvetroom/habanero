import UIKit

final class ViewText:ViewMain<ArchText>
{
    weak var viewInput:ViewTextInput!
    weak var layoutBarBottom:NSLayoutConstraint!
    
    required init(controller:ControllerText)
    {
        super.init(controller:controller)
        
        self.factoryViews()
        
        NotificationCenter.default.addObserver(
            self,
            selector:#selector(self.notifiedKeyboardChanged(sender:)),
            name:NSNotification.Name.UIKeyboardWillChangeFrame,
            object:nil)
    }
    
    required init?(coder:NSCoder)
    {
        return nil
    }
    
    deinit
    {
        NotificationCenter.default.removeObserver(self)
    }
    
    //MARK: notifications
    
    @objc
    private func notifiedKeyboardChanged(sender notification:Notification)
    {
        guard
            
            let userInfo:[AnyHashable:Any] = notification.userInfo,
            let keyboardFrameValue:NSValue = userInfo[UIKeyboardFrameEndUserInfoKey] as? NSValue,
            let animationDuration:NSNumber = userInfo[UIKeyboardAnimationDurationUserInfoKey] as? NSNumber
            
        else
        {
            return
        }
        
        let keyRect:CGRect = keyboardFrameValue.cgRectValue
        let originY = keyRect.origin.y
        let height:CGFloat = self.bounds.maxY
        let keyboardHeight:CGFloat
        
        if originY < height
        {
            keyboardHeight = height - originY
        }
        else
        {
            keyboardHeight = 0
        }
        
        self.layoutBarBottom.constant = -keyboardHeight
        
        UIView.animate(withDuration:animationDuration.doubleValue)
        { [weak self] in
            
            self?.layoutIfNeeded()
        }
    }
}
