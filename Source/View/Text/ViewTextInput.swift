import UIKit

final class ViewTextInput:UITextView
{
    init()
    {
        super.init(frame:CGRect.zero, textContainer:nil)
        self.clipsToBounds = true
        self.translatesAutoresizingMaskIntoConstraints = false
        self.backgroundColor = UIColor.clear
        self.textColor = UIColor.colourBackgroundDark
        self.tintColor = UIColor.colourBackgroundDark
        self.bounces = true
        self.alwaysBounceVertical = true
        self.isScrollEnabled = true
        self.showsVerticalScrollIndicator = true
        self.showsHorizontalScrollIndicator = false
        self.returnKeyType = UIReturnKeyType.default
        self.keyboardAppearance = UIKeyboardAppearance.light
        self.autocorrectionType = UITextAutocorrectionType.no
        self.spellCheckingType = UITextSpellCheckingType.yes
        self.autocapitalizationType = UITextAutocapitalizationType.sentences
        self.keyboardType = UIKeyboardType.alphabet
        self.contentInset = UIEdgeInsets.zero
        self.textAlignment = NSTextAlignment.left
        self.font = UIFont.regular(size:ViewTextInput.Constants.fontSize)
        self.textContainerInset = UIEdgeInsets(
            top:ViewTextInput.Constants.insetsTop,
            left:ViewTextInput.Constants.insetsHorizontal,
            bottom:0,
            right:ViewTextInput.Constants.insetsHorizontal)
    }
    
    required init?(coder:NSCoder)
    {
        return nil
    }
}
