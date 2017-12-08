import UIKit

extension ViewNewAddList
{
    //MARK: internal
    
    func modelAtIndex(index:IndexPath) -> NewAddSectionItemProtocol
    {
        let section:NewAddSectionProtocol = self.sectionAtIndex(section:index.section)
        let item:NewAddSectionItemProtocol = section.items[index.item]
        
        return item
    }
    
    func sectionAtIndex(section:Int) -> NewAddSectionProtocol
    {
        let section:NewAddSectionProtocol = self.controller.model.sections[section]
        
        return section
    }
    
    func dequeueHeaderAtIndex(index:IndexPath) -> ViewNewAddListHeader
    {
        let section:NewAddSectionProtocol = self.sectionAtIndex(section:index.section)
        
        let header:ViewNewAddListHeader = self.reusableAtIndex(
            kind:UICollectionElementKindSectionHeader,
            indexPath:index)
        
        header.config(model:section)
        
        return header
    }
    
    func dequeueFooterAtIndex(index:IndexPath) -> ViewNewAddListFooter
    {
        let section:NewAddSectionProtocol = self.sectionAtIndex(section:index.section)
        
        let footer:ViewNewAddListFooter = self.reusableAtIndex(
            kind:UICollectionElementKindSectionFooter,
            indexPath:index,
            reusableIdentifier:section.footerReusableIdentifier)
        
        footer.config(controller:self.controller)
        
        return footer
    }
}
