import UIKit

final class ViewPhotoCropDisplayImage:View<ArchPhotoCrop>, UIScrollViewDelegate
{
    private(set) weak var viewScroll:UIScrollView!
    private weak var imageView:UIImageView!
    private var marginVertical:CGFloat?
    
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
        viewScroll.delegate = self
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
        let ratioHeight:CGFloat = image.size.height / ratioWidth
        let maxHeight:CGFloat = max(height, ratioHeight)
        let remainHeight:CGFloat = height - width
        let contentHeight:CGFloat = maxHeight + remainHeight
        let marginVertical:CGFloat = remainHeight / 2
        self.marginVertical = marginVertical
        
        let imageRect:CGRect = CGRect(
            x:0,
            y:marginVertical,
            width:width,
            height:ratioHeight)
        
        let contentSize:CGSize = CGSize(
            width:width,
            height:contentHeight)
        
        self.imageView.frame = imageRect
        self.imageView.image = image
        self.viewScroll.contentSize = contentSize
    }
    
    //MARK: scrollView delegate
    
    func viewForZooming(in scrollView:UIScrollView) -> UIView?
    {
        return self.imageView
    }
    
    func scrollViewDidEndZooming(
        _ scrollView:UIScrollView,
        with view:UIView?,
        atScale scale:CGFloat)
    {
        guard
        
            let viewFrame:CGRect = view?.frame,
            let marginVertical:CGFloat = self.marginVertical
        
        else
        {
            return
        }
        
        let contentSize:CGSize = CGSize(
            width:viewFrame.maxX,
            height:viewFrame.maxY + marginVertical)
        
        self.viewScroll.contentSize = contentSize
    }
}
