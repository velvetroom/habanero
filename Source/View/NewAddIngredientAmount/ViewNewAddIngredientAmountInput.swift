import UIKit

final class ViewNewAddIngredientAmountInput:View<ArchNewAddIngredientAmount>
{
    private(set) weak var viewText:UITextView!
    
    override func factoryViews()
    {
        super.factoryViews()
        
        let viewText:UITextView = UITextView()
        viewText.translatesAutoresizingMaskIntoConstraints = false
        
        self.viewText = viewText
        
        addSubview(viewText)
    }
}
