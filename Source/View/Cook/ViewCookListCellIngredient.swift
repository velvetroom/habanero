import UIKit

final class ViewCookListCellIngredient:ViewCookListCell
{
    override func factoryViews()
    {
        super.factoryViews()
        
        let square:UIImageView = UIImageView()
        square.isUserInteractionEnabled = false
        square.translatesAutoresizingMaskIntoConstraints = false
        square.clipsToBounds = true
        square.contentMode = UIViewContentMode.center
        square.image = #imageLiteral(resourceName: "assetGenericSquare")
        
        self.addSubview(square)
        
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
    }
}
