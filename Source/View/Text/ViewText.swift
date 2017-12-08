import UIKit

final class ViewText:ViewMain<ArchText>
{
    weak var viewInput:ViewTextInput!
    weak var layoutInputBottom:NSLayoutConstraint!
    
    required init(controller:ControllerText)
    {
        super.init(controller:controller)
        
        self.factoryViews()
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
        
        self.layoutInputBottom.constant = -keyboardHeight
        
        UIView.animate(withDuration:animationDuration.doubleValue)
        { [weak self] in
            
            self?.layoutIfNeeded()
        }
    }
    
    //MARK: private
    
    private func factoryViews()
    {
        let viewInput:ViewTextInput = ViewTextInput()
        self.viewInput = viewInput
        
        self.addSubview(viewInput)
        
        NSLayoutConstraint.topToTop(
            view:viewInput,
            toView:self)
        layoutInputBottom = NSLayoutConstraint.bottomToBottom(
            view:viewInput,
            toView:self)
        NSLayoutConstraint.equalsHorizontal(
            view:viewInput,
            toView:self)
    }
}
