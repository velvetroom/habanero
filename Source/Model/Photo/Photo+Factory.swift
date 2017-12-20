import Foundation

extension Photo
{
    //MARK: internal
    
    class func factoryOptions() -> [PhotoOptionProtocol]
    {
        let optionCancel:PhotoOptionCancel = PhotoOptionCancel()
        
        let options:[PhotoOptionProtocol] = [
            optionCancel]
        
        return options
    }
}
