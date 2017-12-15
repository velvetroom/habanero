import UIKit

final class ViewNewAddIngredientAmountInput:View<ArchNewAddIngredientAmount>
{
    private(set) weak var textView:UITextView!
    
    override func factoryViews()
    {
        super.factoryViews()
        
        let textView:UITextView = UITextView()
        textView.translatesAutoresizingMaskIntoConstraints = false
        
        self.textView = textView
        
        self.addSubview(textView)
    }
}
