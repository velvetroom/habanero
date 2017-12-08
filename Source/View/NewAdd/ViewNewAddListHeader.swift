import UIKit

final class ViewNewAddListHeader:UICollectionReusableView
{
    private weak var labelTitle:UILabel!
    
    override init(frame:CGRect)
    {
        super.init(frame:frame)
        self.clipsToBounds = true
        self.backgroundColor = UIColor.clear
        self.isUserInteractionEnabled = false
        
        self.factoryViews()
    }
    
    required init?(coder:NSCoder)
    {
        return nil
    }
    
    //MARK: private
    
    private func factoryViews()
    {
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
