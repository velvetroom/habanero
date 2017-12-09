import UIKit

final class ViewNewAddListHeader:ViewCollectionReusable
{
    private weak var labelTitle:UILabel!

    override func factoryViews()
    {
        super.factoryViews()
        
        self.isUserInteractionEnabled = false
        
        let labelTitle:UILabel = UILabel()
        labelTitle.isUserInteractionEnabled = false
        labelTitle.translatesAutoresizingMaskIntoConstraints = false
        labelTitle.backgroundColor = UIColor.clear
        labelTitle.textColor = UIColor(white:0, alpha:0.6)
        labelTitle.font = UIFont.regular(size:ViewGlobal.Constants.barTitleFontSize)
        self.labelTitle = labelTitle
        
        self.addSubview(labelTitle)
        
        NSLayoutConstraint.bottomToBottom(
            view:labelTitle,
            toView:self)
        NSLayoutConstraint.height(
            view:labelTitle,
            constant:ViewNewAddListHeader.Constants.titleHeight)
        NSLayoutConstraint.leftToLeft(
            view:labelTitle,
            toView:self,
            constant:ViewNewAddList.Constants.marginHorizontal)
        NSLayoutConstraint.widthGreaterOrEqual(
            view:labelTitle)
    }
    
    //MARK: internal
    
    func config(model:NewAddSectionProtocol)
    {
        self.labelTitle.text = model.title
    }
}
