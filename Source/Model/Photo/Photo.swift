import UIKit

final class Photo:Model<ArchPhoto>
{
    var completion:((UIImage?) -> ())?
    let options:[PhotoOptionProtocol]
    
    required init()
    {
        self.options = Photo.factoryOptions()
        
        super.init()
    }
}
