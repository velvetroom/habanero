import UIKit

final class ViewNewListCell:ViewCollectionCell
{
    private(set) weak var viewSteps:ViewNewListCellSteps!
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
        
        let viewSteps:ViewNewListCellSteps = ViewNewListCellSteps()
        self.viewSteps = viewSteps
        
        addSubview(labelInfo)
        addSubview(viewSteps)
        
        NSLayoutConstraint.topToTop(
            view:labelInfo,
            toView:self,
            constant:ViewNewListCell.Constants.infoTop)
        NSLayoutConstraint.heightGreaterOrEqual(
            view:labelInfo)
        NSLayoutConstraint.leftToLeft(
            view:labelInfo,
            toView:self,
            constant:ViewNewListCell.Constants.infoLeft)
        NSLayoutConstraint.rightToLeft(
            view:labelInfo,
            toView:viewSteps)
        
        NSLayoutConstraint.equalsVertical(
            view:viewSteps,
            toView:self)
        NSLayoutConstraint.width(
            view:viewSteps,
            constant:ViewNewListCell.Constants.stepsWidth)
        NSLayoutConstraint.rightToRight(
            view:viewSteps,
            toView:self)
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
