import UIKit

extension ViewNewListCell
{
    //MARK: private
    
    private func updateInfo(model:NewItem)
    {
        let title:NSAttributedString = NSAttributedString(
            string:model.title,
            attributes:self.attributesTitle)
        
        let duration:NSAttributedString = NSAttributedString(
            string:model.duration,
            attributes:self.attributesDuration)
        
        let mutableString:NSMutableAttributedString = NSMutableAttributedString()
        mutableString.append(title)
        mutableString.appendNewLine()
        mutableString.append(duration)
        
        self.labelInfo.attributedText = mutableString
    }
    
    //MARK: internal
    
    func config(model:NewItem)
    {
        self.imageView.image = model.image
        self.updateInfo(model:model)
        self.viewSteps.config(model:model)
        self.showState()
    }
}
