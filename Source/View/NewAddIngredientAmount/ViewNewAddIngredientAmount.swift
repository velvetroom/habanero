import UIKit

final class ViewNewAddIngredientAmount:ViewMain<ArchNewAddIngredientAmount>
{
    private(set) weak var viewInput:ViewNewAddIngredientAmountInput!
    private(set) weak var viewList:ViewNewAddIngredientAmountList!
    
    override func factoryViews()
    {
        super.factoryViews()
        
        self.shouldPanBack = true
        self.backgroundColor = UIColor.colourBackgroundGray
        
        let viewBar:ViewNewAddIngredientAmountBar = ViewNewAddIngredientAmountBar(controller:self.controller)
        
        let viewInput:ViewNewAddIngredientAmountInput = ViewNewAddIngredientAmountInput(controller:self.controller)
        self.viewInput = viewInput
        
        let viewList:ViewNewAddIngredientAmountList = ViewNewAddIngredientAmountList(controller:self.controller)
        self.viewList = viewList
        
        self.addSubview(viewList)
        self.addSubview(viewInput)
        self.addSubview(viewBar)
        
        NSLayoutConstraint.equals(
            view:viewList,
            toView:self)
        
        NSLayoutConstraint.topToTop(
            view:viewBar,
            toView:self)
        NSLayoutConstraint.height(
            view:viewBar,
            constant:ViewGlobal.Constants.barHeight)
        NSLayoutConstraint.equalsHorizontal(
            view:viewBar,
            toView:self)
        
        NSLayoutConstraint.topToBottom(
            view:viewInput,
            toView:viewBar)
        NSLayoutConstraint.height(
            view:viewInput,
            constant:ViewNewAddIngredientAmount.Constants.inputHeight)
        NSLayoutConstraint.equalsHorizontal(
            view:viewInput,
            toView:self)
    }
}
