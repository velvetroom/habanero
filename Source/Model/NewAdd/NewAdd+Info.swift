import UIKit

extension NewAdd
{
    //MARK: private
    
    private func infoUpdated(completion:@escaping(() -> ()))
    {
        self.database?.save
        {
            DispatchQueue.main.async
            {
                completion()
            }
        }
    }
    
    private func asyncUpdateInfoImage(
        image:UIImage,
        completion:@escaping(() -> ()))
    {
        guard
            
            let imageIdentifier:String = self.build?.imageIdentifier
            
        else
        {
            self.createInfoImage(
                image:image,
                completion:completion)
            
            return
        }
        
        self.replaceInfoImage(
            image:image,
            imageIdentifier:imageIdentifier,
            completion:completion)
    }
    
    private func replaceInfoImage(
        image:UIImage,
        imageIdentifier:String,
        completion:@escaping(() -> ()))
    {
        guard
            
            let imageURL:URL = NewAdd.localURLForImage(identifier:imageIdentifier)
            
        else
        {
            return
        }
        
        do
        {
            try NewAdd.store(
                image:image,
                at:imageURL)
        }
        catch
        {
            return
        }
        
        DispatchQueue.main.async
        {
            completion()
        }
    }
    
    private func createInfoImage(
        image:UIImage,
        completion:@escaping(() -> ()))
    {
        guard
            
            let database:Database = self.database,
            let build:Build = self.build,
            let imageIdentifier:String = NewAdd.createIdentifierAndStoreLocally(image:image)
            
        else
        {
            return
        }
        
        build.imageIdentifier = imageIdentifier
        
        database.save
        {
            DispatchQueue.main.async
            {
                completion()
            }
        }
    }
    
    private func updateCurrentDurationValue(duration:TimeInterval)
    {
        for section:NewAddSectionProtocol in self.sections
        {
            guard
            
                var section:NewAddSectionInfo = section as? NewAddSectionInfo
            
            else
            {
                continue
            }
            
            let countItems:Int = section.items.count
            
            for index:Int in 0 ..< countItems
            {
                let item:NewAddSectionItemProtocol = section.items[index]
                
                guard
                
                    var itemDuration:NewAddSectionItemInfoDuration = item as? NewAddSectionItemInfoDuration
                
                else
                {
                    continue
                }
                
                itemDuration.updateDuration(duration:duration)
                section.items.remove(at:index)
                section.items.insert(itemDuration, at:index)
                
                break
            }
            
            break
        }
    }
    
    //MARK: internal
    
    func editInfoTitle(
        title:String,
        completion:@escaping(() -> ()))
    {
        DispatchQueue.global(qos:DispatchQoS.QoSClass.background).async
        { [weak self] in
                
            self?.build?.title = title
            
            self?.infoUpdated(completion:completion)
        }
    }
    
    func editInfoSubtitle(
        subtitle:String,
        completion:@escaping(() -> ()))
    {
        DispatchQueue.global(qos:DispatchQoS.QoSClass.background).async
        { [weak self] in
            
            self?.build?.subtitle = subtitle
            
            self?.infoUpdated(completion:completion)
        }
    }
    
    func durationEdited(duration:TimeInterval)
    {
        DispatchQueue.global(qos:DispatchQoS.QoSClass.background).async
        { [weak self] in
            
            self?.build?.duration = duration
            self?.database?.save(completion:nil)
        }
    }
    
    func updateInfoImage(
        image:UIImage,
        completion:@escaping(() -> ()))
    {
        DispatchQueue.global(qos:DispatchQoS.QoSClass.background).async
        { [weak self] in
                
            self?.asyncUpdateInfoImage(
                image:image,
                completion:completion)
        }
    }
}
