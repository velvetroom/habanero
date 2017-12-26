import UIKit

final class ViewPhotoCropDisplayImage:View<ArchPhotoCrop>
{
    private(set) weak var viewScroll:UIScrollView!
    private weak var imageView:UIImageView!
    
    override func factoryViews()
    {
        super.factoryViews()
        
        let viewScroll:UIScrollView = UIScrollView()
        viewScroll.translatesAutoresizingMaskIntoConstraints = false
        viewScroll.clipsToBounds = true
        viewScroll.backgroundColor = UIColor.clear
        viewScroll.bouncesZoom = true
        viewScroll.bounces = true
        viewScroll.isScrollEnabled = true
        viewScroll.alwaysBounceVertical = true
        viewScroll.alwaysBounceHorizontal = true
        viewScroll.showsVerticalScrollIndicator = false
        viewScroll.showsHorizontalScrollIndicator = false
        viewScroll.minimumZoomScale = ViewPhotoCropDisplayImage.Constants.minZoom
        viewScroll.maximumZoomScale = ViewPhotoCropDisplayImage.Constants.maxZoom
        self.viewScroll = viewScroll
        
        let imageView:UIImageView = UIImageView()
        imageView.isUserInteractionEnabled = false
        imageView.contentMode = UIViewContentMode.scaleAspectFit
        imageView.clipsToBounds = true
        self.imageView = imageView
        
        viewScroll.addSubview(imageView)
        self.addSubview(viewScroll)
        
        NSLayoutConstraint.equals(
            view:viewScroll,
            toView:self)
    }
    
    //MARK: internal
    
    func adjustImage()
    {
        guard
            
            let image:UIImage = self.controller.model.image
        
        else
        {
            return
        }
        
        let width:CGFloat = self.bounds.width
        let height:CGFloat = self.bounds.height
        let ratioWidth:CGFloat = image.size.width / width
        let ratioHeight:CGFloat = image.size.height * ratioWidth
        let remainHeight:CGFloat = height - ratioHeight
        let marginTop:CGFloat = remainHeight / 2.0
        
        let imageRect:CGRect = CGRect(
            x:0,
            y:marginTop,
            width:width,
            height:ratioHeight)
        
        self.imageView.frame = imageRect
        self.imageView.image = image
    }
}
