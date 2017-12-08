import Foundation

final class Text:Model<ArchText>
{
    var completion:((String) -> ())?
    var text:String
    
    required init()
    {
        self.text = String()
        
        super.init()
    }
}
