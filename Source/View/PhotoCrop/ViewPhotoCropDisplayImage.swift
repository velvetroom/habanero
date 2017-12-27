import UIKit

final class ViewPhotoCropDisplayImage:View<ArchPhotoCrop>, UIScrollViewDelegate
{
    private(set) weak var viewScroll:UIScrollView!
    private weak var imageView:UIImageView!
    private var marginVertical:CGFloat?
    
    private var adjustedImageSize:CGSize?
    {
        get
        {
            guard
                
                let image:UIImage = self.controller.model.image
                
            else
            {
                return nil
            }
            
            let width:CGFloat = self.bounds.width
            let ratio:CGFloat = image.size.width / width
            var ratioWidth:CGFloat = image.size.width / ratio
            var ratioHeight:CGFloat = image.size.height / ratio
            
            if ratioHeight < width
            {
                let scale:CGFloat = width / ratioHeight
                
                ratioWidth *= scale
                ratioHeight *= scale
            }
            
            let size:CGSize = CGSize(
                width:ratioWidth,
                height:ratioHeight)
            
            return size
        }
    }
    
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
            
            let adjustedSize:CGSize = self.adjustedImageSize
        
        else
        {
            return
        }
        
        let width:CGFloat = self.bounds.width
        let height:CGFloat = self.bounds.height
        let remainHeight:CGFloat = height - width
        let contentHeight:CGFloat = adjustedSize.height + remainHeight
        let marginVertical:CGFloat = remainHeight / 2
        self.marginVertical = marginVertical
        
        let imageRect:CGRect = CGRect(
            x:0,
            y:marginVertical,
            width:adjustedSize.width,
            height:adjustedSize.height)
        
        let contentSize:CGSize = CGSize(
            width:adjustedSize.width,
            height:contentHeight)
        
        self.imageView.frame = imageRect
        self.imageView.image = self.controller.model.image
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
