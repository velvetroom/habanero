import UIKit

extension NewAdd
{
    //MARK: private
    
    private func asyncDelete(completion:@escaping(() -> ()))
    {
        guard
        
            let build:Build = self.build,
            let database:Database = self.database
        
        else
        {
            return
        }
        
        database.delete(data:build)
        { [weak self] in
            
            self?.infoUpdated(completion:completion)
        }
    }
    
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
    
    //MARK: internal
    
    func delete(completion:@escaping(() -> ()))
    {
        DispatchQueue.global(qos:DispatchQoS.QoSClass.background).async
        { [weak self] in
            
            self?.asyncDelete(completion:completion)
        }
    }
    
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
