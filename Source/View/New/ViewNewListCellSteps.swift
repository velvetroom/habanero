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
        image.contentMode = UIViewContentMode.center
        image.clipsToBounds = true
        image.image = #imageLiteral(resourceName: "assetNewSteps")
        
        let label:UILabel = UILabel()
        label.isUserInteractionEnabled = false
        label.translatesAutoresizingMaskIntoConstraints = false
        label.backgroundColor = UIColor.clear
        label.textAlignment = NSTextAlignment.center
        label.font = UIFont.bold(size:ViewNewListCellSteps.Constants.fontSize)
        label.textColor = UIColor.colourSuccess
        self.label = label
        
        self.addSubview(image)
        self.addSubview(label)
        
        NSLayoutConstraint.equals(
            view:image,
            toView:self)
    }
    
    //MARK: internal
    
    func config(model:NewItem)
    {
        let steps:String = String(describing:model.steps)
        self.label.text = steps
    }
}
