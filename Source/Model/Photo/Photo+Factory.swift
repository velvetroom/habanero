import Foundation

extension Photo
{
    //MARK: internal
    
    class func factoryOptions() -> [PhotoOptionProtocol]
    {
        let optionCamera:PhotoOptionCamera = PhotoOptionCamera()
        let optionLibrary:PhotoOptionLibrary = PhotoOptionLibrary()
        let optionCancel:PhotoOptionCancel = PhotoOptionCancel()
        
        let options:[PhotoOptionProtocol] = [
            optionCamera,
            optionLibrary,
            optionCancel]
        
        return options
    }
}
