import UIKit

final class ViewNewAddIngredientAmountInput:View<ArchNewAddIngredientAmount>
{
    private(set) weak var textField:UITextField!
    
    override func factoryViews()
    {
        super.factoryViews()
        
        let textField:UITextField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.borderStyle = UITextBorderStyle.none
        textField.autocapitalizationType = UITextAutocapitalizationType.none
        textField.autocorrectionType = UITextAutocorrectionType.no
        textField.clearButtonMode = UITextFieldViewMode.never
        textField.clearsOnBeginEditing = false
        textField.clearsOnInsertion = false
        textField.font = UIFont.regular(size:ViewNewAddIngredientAmountInput.Constants.fieldFontSize)
        textField.keyboardAppearance = UIKeyboardAppearance.light
        textField.keyboardType = UIKeyboardType.decimalPad
        textField.returnKeyType = UIReturnKeyType.default
        textField.spellCheckingType = UITextSpellCheckingType.no
        textField.tintColor = UIColor.colourBackgroundDark
        textField.textColor = UIColor.colourBackgroundDark
        textField.textAlignment = NSTextAlignment.right
        textField.backgroundColor = UIColor.white
        textField.placeholder = String.localizedView(key:"ViewNewAddIngredientAmountInput_textField")
        self.textField = textField
        
        self.addSubview(textField)
    }
}
