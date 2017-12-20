import UIKit

final class Photo:Model<ArchPhoto>
{
    var completion:((UIImage) -> ())?
}
