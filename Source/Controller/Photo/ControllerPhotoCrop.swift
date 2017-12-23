import UIKit

final class ControllerPhotoCrop:Controller<ArchPhotoCrop>
{
    init(image:UIImage)
    {
        super.init()
        
        self.model.image = image
    }
    
    required init?(coder:NSCoder)
    {
        return nil
    }
}
