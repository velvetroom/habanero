import UIKit

class ViewCollectionCell:UICollectionViewCell
{
    override var isSelected:Bool
    {
        didSet
        {
            self.showState()
        }
    }
    
    override var isHighlighted:Bool
    {
        didSet
        {
            self.showState()
        }
    }
    
    //MARK: private
    
    private func showState()
    {
        if self.isSelected || self.isHighlighted
        {
            self.showHighlighted()
        }
        else
        {
            self.showReleased()
        }
    }
    
    //MARK: internal
    
    func showReleased() { }
    
    func showHighlighted() { }
}
