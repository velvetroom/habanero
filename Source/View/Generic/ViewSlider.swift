import UIKit

final class ViewSlider:UIView
{
    typealias Router = (
        (ViewSlider) ->
        (UIPanGestureRecognizer) -> ())
    
    var panInitialWidth:CGFloat?
    var percentUsed:CGFloat
    private(set) weak var viewBase:UIView!
    private(set) weak var viewBar:ViewSliderBar!
    private(set) weak var layoutBarWidth:NSLayoutConstraint!
    private(set) var sliderChange:((CGFloat) -> ())?
    private(set) var slidingFinished:(() -> ())?
    
    init(
        percentUsed:CGFloat = 0,
        sliderChange:((CGFloat) -> ())? = nil,
        slidingFinished:(() -> ())? = nil)
    {
        self.percentUsed = percentUsed
        
        super.init(frame:CGRect.zero)
        clipsToBounds = true
        backgroundColor = UIColor.clear
        translatesAutoresizingMaskIntoConstraints = false
        self.sliderChange = sliderChange
        self.slidingFinished = slidingFinished
        
        factoryViews()
    }
    
    required init?(coder:NSCoder)
    {
        return nil
    }
    
    override func layoutSubviews()
    {
        super.layoutSubviews()
        layoutSlider()
    }
    
    //MARK: private
    
    private func factoryViews()
    {
        let viewBase:UIView = UIView()
        viewBase.clipsToBounds = true
        viewBase.backgroundColor = UIColor(white:0.95, alpha:1)
        viewBase.translatesAutoresizingMaskIntoConstraints = false
        viewBase.layer.cornerRadius = ViewSlider.Constants.cornerRadius
        viewBase.layer.borderWidth = ViewMain.Constants.borderWidth
        viewBase.layer.borderColor = UIColor(white:0, alpha:0.2).cgColor
        self.viewBase = viewBase
        
        let viewBar:ViewSliderBar = ViewSliderBar()
        self.viewBar = viewBar
        
        viewBase.addSubview(viewBar)
        addSubview(viewBase)
        
        NSLayoutConstraint.equalsVertical(
            view:viewBase,
            toView:self)
        NSLayoutConstraint.equalsHorizontal(
            view:viewBase,
            toView:self,
            margin:ViewSlider.Constants.horizontalMargin)
        
        NSLayoutConstraint.equalsVertical(
            view:viewBar,
            toView:viewBase)
        NSLayoutConstraint.leftToLeft(
            view:viewBar,
            toView:viewBase)
        layoutBarWidth = NSLayoutConstraint.width(
            view:viewBar)
        
        let gesture:UIPanGestureRecognizer = factoryGestureRecognizer()
        
        addGestureRecognizer(gesture)
    }
    
    private func layoutSlider()
    {
        let width:CGFloat = viewBase.bounds.maxX
        let percentWidth:CGFloat = percentUsed * width
        layoutBarWidth.constant = percentWidth
    }
    
    //MARK: internal
    
    func changeSlider(percentUsed:CGFloat)
    {
        self.percentUsed = percentUsed
        layoutSlider()
    }
}
