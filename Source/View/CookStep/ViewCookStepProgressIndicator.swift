import UIKit

final class ViewCookStepProgressIndicator:View<ArchCookStep>
{
    private(set) weak var label:UILabel!
    
    override func factoryViews()
    {
        super.factoryViews()
        self.isUserInteractionEnabled = false
        
        let imageView:UIImageView = UIImageView()
        imageView.isUserInteractionEnabled = false
        imageView.contentMode = UIViewContentMode.center
        imageView.classForCoder = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = #imageLiteral(resourceName: "assetCookProgressIndicator")
        
        let label:UILabel = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.isUserInteractionEnabled = false
        label.backgroundColor = UIColor.clear
        label.textColor = UIColor.clear
        label.textAlignment = NSTextAlignment.center
        label.font = UIFont.regular(size:ViewCookStepProgressIndicator.Constants.fontSize)
        label.textColor = UIColor.white
        self.label = label
        
        self.addSubview(imageView)
        self.addSubview(label)
        
        NSLayoutConstraint.equals(
            view:imageView,
            toView:self)
        
        NSLayoutConstraint.equals(
            view:label,
            toView:self)
    }
}
