import UIKit

final class ViewCookListCellIngredient:ViewCookListCell
{
    private weak var labelText:UILabel!
    
    override func factoryViews()
    {
        super.factoryViews()
        
        let square:UIImageView = UIImageView()
        square.isUserInteractionEnabled = false
        square.translatesAutoresizingMaskIntoConstraints = false
        square.clipsToBounds = true
        square.contentMode = UIViewContentMode.center
        square.image = #imageLiteral(resourceName: "assetGenericSquare")
        
        let labelText:UILabel = UILabel()
        labelText.translatesAutoresizingMaskIntoConstraints = false
        labelText.isUserInteractionEnabled = false
        labelText.backgroundColor = UIColor.clear
        labelText.numberOfLines = 0
        self.labelText = labelText
        
        self.addSubview(square)
        self.addSubview(labelText)
        
        NSLayoutConstraint.topToTop(
            view:square,
            toView:self,
            constant:ViewCookList.Constants.marginHorizontal)
        NSLayoutConstraint.leftToLeft(
            view:square,
            toView:self,
            constant:ViewCookList.Constants.marginHorizontal)
        NSLayoutConstraint.size(
            view:square,
            constant:ViewCookListCellIngredient.Constants.squareSize)
        
        NSLayoutConstraint.topToTop(
            view:labelText,
            toView:self,
            constant:ViewCookList.Constants.marginHorizontal)
        NSLayoutConstraint.heightGreaterOrEqual(
            view:labelText)
        NSLayoutConstraint.leftToRight(
            view:labelText,
            toView:square,
            constant:ViewCookListCellIngredient.Constants.textLeft)
        NSLayoutConstraint.rightToRight(
            view:labelText,
            toView:self,
            constant:-ViewCookList.Constants.marginHorizontal)
    }
}
