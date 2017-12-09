import UIKit

final class ViewNewListCell:ViewCollectionCell
{
    private(set) weak var labelInfo:UILabel!
    private let attributesTitle:[NSAttributedStringKey:Any]
    private let attributesDuration:[NSAttributedStringKey:Any]
    
    override init(frame:CGRect)
    {
        self.attributesTitle = [
            NSAttributedStringKey.font:UIFont.regular(size:ViewNewListCell.Constants.titleFontSize),
            NSAttributedStringKey.foregroundColor:UIColor.colourBackgroundDark]
        
        self.attributesDuration = [
            NSAttributedStringKey.font:UIFont.regular(size:ViewNewListCell.Constants.durationFontSize),
            NSAttributedStringKey.foregroundColor:UIColor(white:0, alpha:0.6)]
        
        super.init(frame:frame)
    }
    
    required init?(coder:NSCoder)
    {
        return nil
    }
    
    override func factoryViews()
    {
        super.factoryViews()
        
        self.backgroundColor = UIColor.white
        
        let labelInfo:UILabel = UILabel()
        labelInfo.isUserInteractionEnabled = false
        labelInfo.translatesAutoresizingMaskIntoConstraints = false
        labelInfo.backgroundColor = UIColor.clear
        labelInfo.numberOfLines = 0
        self.labelInfo = labelInfo
        
        addSubview(labelInfo)
        
        NSLayoutConstraint.topToTop(
            view:labelInfo,
            toView:self,
            constant:ViewNewListCell.Constants.infoTop)
        NSLayoutConstraint.leftToLeft(
            view:labelInfo,
            toView:self,
            constant:ViewNewListCell.Constants.infoLeft)
        NSLayoutConstraint.heightGreaterOrEqual(
            view:labelInfo)
    }
    
    override func showReleased()
    {
        super.showReleased()
        
        self.alpha = 1
    }
    
    override func showHighlighted()
    {
        super.showHighlighted()
        
        self.alpha = 0.3
    }
}
