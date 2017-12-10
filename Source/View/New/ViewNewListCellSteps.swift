import UIKit

final class ViewNewListCellSteps:UIView
{
    private weak var label:UILabel!
    
    override init(frame:CGRect)
    {
        super.init(frame:frame)
        self.clipsToBounds = true
        self.translatesAutoresizingMaskIntoConstraints = false
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
        let image:UIImageView = UIImageView()
        image.isUserInteractionEnabled = false
        image.translatesAutoresizingMaskIntoConstraints = false
        image.contentMode = UIViewContentMode.bottomRight
        image.clipsToBounds = true
        image.image = #imageLiteral(resourceName: "assetNewSteps")
        
        self.addSubview(image)
        
        NSLayoutConstraint.equals(
            view:image,
            toView:self)
    }
}
