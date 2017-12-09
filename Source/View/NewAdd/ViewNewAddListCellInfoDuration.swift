import UIKit

final class ViewNewAddListCellInfoDuration:ViewNewAddListCell
{
    private weak var viewSlider:UISlider!
    private var model:NewAddSectionItemInfoDuration?
    
    override func factoryViews()
    {
        super.factoryViews()
        
        let viewSlider:UISlider = UISlider()
        viewSlider.translatesAutoresizingMaskIntoConstraints = false
        viewSlider.minimumTrackTintColor = UIColor.colourBackgroundDark
        viewSlider.maximumTrackTintColor = UIColor.colourBackgroundGray
        viewSlider.minimumValue = 0
        viewSlider.addTarget(
            self,
            action:#selector(self.selectorSlider(sender:)),
            for:UIControlEvents.valueChanged)
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
    
    override func config(
        controller:ControllerNewAdd,
        model:NewAddSectionItemProtocol)
    {
        super.config(
            controller:controller,
            model:model)
        
        guard
        
            let model:NewAddSectionItemInfoDuration = model as? NewAddSectionItemInfoDuration
        
        else
        {
            return
        }
        
        let maxValue:Float = Float(model.minutes.count - 1)
        self.viewSlider.maximumValue = maxValue
        self.model = model
    }
    
    //MARK: selectors
    
    @objc
    private func selectorSlider(sender slider:UISlider)
    {
        let roundedValue:Float = round(slider.value)
        let value:Int = Int(roundedValue)
        
        self.sliderUpdated(value:value)
    }
    
    //MARK: private
    
    private func sliderUpdated(value:Int)
    {
        guard
        
            let minutesList:[TimeInterval] = self.model?.minutes,
            minutesList.count > value
        
        else
        {
            return
        }
        
        let minutes:TimeInterval = minutesList[value]
        let seconds:TimeInterval = minutes * ViewFormat.Constants.Duration.secondsPerMinute
        let duration:String? = ViewFormat.factoryDuration(duration:seconds)
    }
}
