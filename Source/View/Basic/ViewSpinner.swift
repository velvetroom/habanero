import UIKit

final class ViewSpinner:UIImageView
{
    init()
    {
        super.init(frame:CGRect.zero)
        isUserInteractionEnabled = false
        translatesAutoresizingMaskIntoConstraints = false
        clipsToBounds = true
        animationDuration = ViewSpinner.Constants.animationDuration
        animationImages = ViewSpinner.Constants.images
        contentMode = UIViewContentMode.center
        startAnimating()
    }
    
    required init?(coder:NSCoder)
    {
        return nil
    }
}
