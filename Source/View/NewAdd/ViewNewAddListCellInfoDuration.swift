import UIKit

final class ViewNewAddListCellInfoDuration:ViewNewAddListCell
{
    private weak var viewSlider:UISlider!
    
    override func factoryViews()
    {
        super.factoryViews()
        
        let viewSlider:UISlider = UISlider()
        viewSlider.translatesAutoresizingMaskIntoConstraints = false
        viewSlider.minimumTrackTintColor = UIColor.colourBackgroundDark
        viewSlider.maximumTrackTintColor = UIColor.colourBackgroundGray
        self.viewSlider = viewSlider
        
        self.addSubview(viewSlider)
        
        NSLayoutConstraint.topToTop(
            view:viewSlider,
            toView:self,
            constant:ViewNewAddListCellInfoDuration.Constants.sliderTop)
        NSLayoutConstraint.height(
            view:viewSlider,
            constant:ViewNewAddListCellInfoDuration.Constants.sliderHeight)
        NSLayoutConstraint.equalsHorizontal(
            view:viewSlider,
            toView:self,
            margin:ViewNewAddList.Constants.marginHorizontal)
    }
}
