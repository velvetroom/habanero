import UIKit

final class ViewNewAddListCellInfoDuration:ViewNewAddListCell
{
    private weak var viewSlider:UISlider!
    private weak var labelDuration:UILabel!
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
        
        let labelDuration:UILabel = UILabel()
        labelDuration.translatesAutoresizingMaskIntoConstraints = false
        labelDuration.backgroundColor = UIColor.clear
        labelDuration.isUserInteractionEnabled = false
        labelDuration.textAlignment = NSTextAlignment.center
        labelDuration.font = UIFont.regular(size:ViewNewAddListCellInfoDuration.Constants.durationFontSize)
        labelDuration.textColor = UIColor.colourBackgroundDark
        self.labelDuration = labelDuration
        
        self.addSubview(labelDuration)
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
        
        NSLayoutConstraint.topToTop(
            view:labelDuration,
            toView:self)
        NSLayoutConstraint.height(
            view:labelDuration,
            constant:ViewNewAddListCellInfoDuration.Constants.durationHeight)
        NSLayoutConstraint.equalsHorizontal(
            view:labelDuration,
            toView:self)
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
        let currentValue:Float = Float(model.minuteSelected)
        
        self.viewSlider.maximumValue = maxValue
        self.viewSlider.value = currentValue
        self.model = model
        
        self.sliderUpdated(value:model.minuteSelected)
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
        self.labelDuration.text = duration
    }
}
