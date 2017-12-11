import UIKit

final class ViewText:ViewMain<ArchText>
{
    weak var viewInput:ViewTextInput!
    weak var layoutBarBottom:NSLayoutConstraint!
    
    override func factoryViews()
    {
        super.factoryViews()
        
        let viewInput:ViewTextInput = ViewTextInput()
        viewInput.text = self.controller.model.text
        self.viewInput = viewInput
        
        let viewBar:ViewTextBar = ViewTextBar(controller:self.controller)
        
        self.addSubview(viewInput)
        self.addSubview(viewBar)
        
        NSLayoutConstraint.topToTop(
            view:viewInput,
            toView:self)
        NSLayoutConstraint.bottomToTop(
            view:viewInput,
            toView:viewBar)
        NSLayoutConstraint.equalsHorizontal(
            view:viewInput,
            toView:self)
        
        layoutBarBottom = NSLayoutConstraint.bottomToBottom(
            view:viewBar,
            toView:self)
        NSLayoutConstraint.height(
            view:viewBar,
            constant:ViewText.Constants.barHeight)
        NSLayoutConstraint.equalsHorizontal(
            view:viewBar,
            toView:self)
        
        NotificationCenter.default.addObserver(
            self,
            selector:#selector(self.notifiedKeyboardChanged(sender:)),
            name:NSNotification.Name.UIKeyboardWillChangeFrame,
            object:nil)
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
