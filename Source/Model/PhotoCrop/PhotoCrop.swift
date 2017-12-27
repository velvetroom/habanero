import UIKit

final class PhotoCrop:Model<ArchPhotoCrop>
{
    var image:UIImage?
    var completion:((UIImage?) -> ())?
}
