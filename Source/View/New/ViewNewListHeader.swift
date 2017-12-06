import UIKit

final class ViewNewListHeader:UICollectionReusableView
{
    override init(frame:CGRect)
    {
        super.init(frame:frame)
        clipsToBounds = true
        backgroundColor = UIColor.clear
        isUserInteractionEnabled = false
        
        let labelTitle:UILabel = UILabel()
        labelTitle.isUserInteractionEnabled = false
        labelTitle.translatesAutoresizingMaskIntoConstraints = false
        labelTitle.backgroundColor = UIColor.clear
        labelTitle.font = UIFont.regular(size:ViewNewListHeader.Constants.titleFontSize)
        labelTitle.textColor = UIColor(white:0, alpha:0.5)
        labelTitle.text = String.localizedView(key:"ViewNewListHeader_labelTitle")
        
        addSubview(labelTitle)
        
        NSLayoutConstraint.bottomToBottom(
            view:labelTitle,
            toView:self)
        NSLayoutConstraint.height(
            view:labelTitle,
            constant:ViewNewListHeader.Constants.titleHeight)
        NSLayoutConstraint.leftToLeft(
            view:labelTitle,
            toView:self,
            constant:ViewNewListHeader.Constants.titleLeft)
        NSLayoutConstraint.widthGreaterOrEqual(
            view:labelTitle)
    }
    
    required init?(coder:NSCoder)
    {
        return nil
    }
}
