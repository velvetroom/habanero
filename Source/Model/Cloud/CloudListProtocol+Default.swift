import Foundation

extension CloudListProtocol
{
    static var identifier:String
    {
        get
        {
            let stringName:String = String(describing:self)
            
            return stringName
        }
    }
    
    var path:String
    {
        get
        {
            var path:String = String()
            
            if let parent:CloudProtocol = self.parent
            {
                path.append(parent.path)
                path.append("/")
            }
            
            path.append(self.identifier)
            
            return path
        }
    }
}
