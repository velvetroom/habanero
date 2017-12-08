import UIKit

final class ViewNewAddListFooterInfo:ViewNewAddListFooter
{
    override func factoryViews()
    {
        let buttonDelete:UIButton = UIButton()
        buttonDelete.translatesAutoresizingMaskIntoConstraints = false
        buttonDelete.setTitleColor(
            UIColor.colourFail,
            for:UIControlState.normal)
        buttonDelete.setTitleColor(
            UIColor.colourBackgroundDark,
            for:UIControlState.highlighted)
        buttonDelete.setTitle(
            String.localizedView(key:"ViewNewAddListFooterInfo_buttonDelete"),
            for:UIControlState())
        buttonDelete.titleLabel!.font = UIFont.medium(size:ViewNewAddListFooterInfo.Constants.buttonFontSize)

        self.addSubview(buttonDelete)
        
        NSLayoutConstraint.equalsVertical(
            view:buttonDelete,
            toView:self)
        NSLayoutConstraint.leftToLeft(
            view:buttonDelete,
            toView:self)
        NSLayoutConstraint.width(
            view:buttonDelete,
            constant:ViewNewAddListFooterInfo.Constants.buttonWidth)
    }
}
