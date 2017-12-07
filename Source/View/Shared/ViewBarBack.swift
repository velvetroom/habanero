import UIKit

class ViewBarBack<A>:ViewBar<A> where A.C:Controller<A>
{
    private(set) weak var buttonBack:UIButton!
    
    required init(controller:A.C)
    {
        super.init(controller:controller)
        
        factoryBackButton()
    }
    
    required init?(coder:NSCoder)
    {
        return nil
    }
    
    //MARK: private
    
    private func factoryBackButton()
    {
        let buttonBack:UIButton = UIButton()
        buttonBack.translatesAutoresizingMaskIntoConstraints = false
        
        self.buttonBack = buttonBack
        
        addSubview(buttonBack)
        
        NSLayoutConstraint.topToTop(
            view:buttonBack,
            toView:self,
            constant:ViewGlobal.Constants.contentTop)
        NSLayoutConstraint.bottomToBottom(
            view:buttonBack,
            toView:self)
        NSLayoutConstraint.leftToLeft(
            view:buttonBack,
            toView:self)
        NSLayoutConstraint.width(
            view:buttonBack,
            constant:ViewGlobal.Constants.barBackWidth)
    }
    
    //MARK: internal
    
    @objc
    func selectorButtonBack(sender button:UIButton) { }
}
