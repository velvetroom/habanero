import UIKit

class VCollection<A, Cell:UICollectionViewCell>:
    View<A>,
    UICollectionViewDelegate,
    UICollectionViewDataSource,
    UICollectionViewDelegateFlowLayout
    where A.C:Controller<A>
{
    private(set) weak var collectionView:UICollectionView!
    
    required init(controller:A.C)
    {
        super.init(controller:controller)
        
        let flow:VCollectionFlow = VCollectionFlow()
        
        let collectionView:UICollectionView = UICollectionView(
            frame:CGRect.zero,
            collectionViewLayout:flow)
        collectionView.clipsToBounds = true
        collectionView.backgroundColor = UIColor.clear
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.showsVerticalScrollIndicator = false
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.delegate = self
        collectionView.dataSource = self
        self.collectionView = collectionView
        
        if #available(iOS 11.0, *)
        {
            collectionView.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentBehavior.never
        }
        
        addSubview(collectionView)
        
        NSLayoutConstraint.equals(
            view:collectionView,
            toView:self)
        
        registerCell(cell:Cell.self)
    }
    
    required init?(coder:NSCoder)
    {
        return nil
    }
    
    //MARK: internal
    
    final func registerCell(cell:Cell.Type)
    {
        collectionView.register(
            cell,
            forCellWithReuseIdentifier:cell.reusableIdentifier)
    }
    
    final func registerFooter(footer:UICollectionReusableView.Type)
    {
        collectionView.register(
            footer,
            forSupplementaryViewOfKind:UICollectionElementKindSectionFooter,
            withReuseIdentifier:footer.reusableIdentifier)
    }
    
    final func registerHeader(header:UICollectionReusableView.Type)
    {
        collectionView.register(
            header,
            forSupplementaryViewOfKind:UICollectionElementKindSectionHeader,
            withReuseIdentifier:header.reusableIdentifier)
    }
    
    final func cellAtIndex<P:UICollectionViewCell>(
        indexPath:IndexPath,
        reusableIdentifier:String = P.reusableIdentifier) -> P
    {
        let cell:P = collectionView.dequeueReusableCell(
            withReuseIdentifier:reusableIdentifier,
            for:indexPath) as! P
        
        return cell
    }
    
    final func reusableAtIndex<P:UICollectionReusableView>(
        kind:String,
        indexPath:IndexPath) -> P
    {
        let reusable:P = collectionView.dequeueReusableSupplementaryView(
            ofKind:kind,
            withReuseIdentifier:P.reusableIdentifier,
            for:indexPath) as! P
        
        return reusable
    }
    
    //MARK: collectionView delegate
    
    func scrollViewWillBeginDragging(_ scrollView:UIScrollView) { }
    
    func scrollViewDidEndDecelerating(_ scrollView:UIScrollView) { }
    
    func scrollViewDidEndDragging(
        _ scrollView:UIScrollView,
        willDecelerate decelerate:Bool) { }
    
    func scrollViewDidEndScrollingAnimation(_ scrollView:UIScrollView) { }
    
    func scrollViewDidScroll(_ scrollView:UIScrollView) { }
    
    func collectionView(
        _ collectionView:UICollectionView,
        layout collectionViewLayout:UICollectionViewLayout,
        insetForSectionAt section:Int) -> UIEdgeInsets
    {
        guard
        
            let flow:VCollectionFlow = collectionView.collectionViewLayout as? VCollectionFlow
        
        else
        {
            return UIEdgeInsets.zero
        }
        
        return flow.sectionInset
    }
    
    func collectionView(
        _ collectionView:UICollectionView,
        layout collectionViewLayout:UICollectionViewLayout,
        referenceSizeForHeaderInSection section:Int) -> CGSize
    {
        guard
            
            let flow:VCollectionFlow = collectionView.collectionViewLayout as? VCollectionFlow
            
        else
        {
            return CGSize.zero
        }
        
        return flow.headerReferenceSize
    }
    
    func collectionView(
        _ collectionView:UICollectionView,
        layout collectionViewLayout:UICollectionViewLayout,
        referenceSizeForFooterInSection section:Int) -> CGSize
    {
        guard
            
            let flow:VCollectionFlow = collectionView.collectionViewLayout as? VCollectionFlow
            
        else
        {
            return CGSize.zero
        }
        
        return flow.footerReferenceSize
    }
    
    func collectionView(
        _ collectionView:UICollectionView,
        layout collectionViewLayout:UICollectionViewLayout,
        sizeForItemAt indexPath:IndexPath) -> CGSize
    {
        guard
            
            let flow:VCollectionFlow = collectionView.collectionViewLayout as? VCollectionFlow
            
        else
        {
            return CGSize.zero
        }
        
        return flow.itemSize
    }
    
    func numberOfSections(in collectionView:UICollectionView) -> Int
    {
        return 1
    }
    
    func collectionView(
        _ collectionView:UICollectionView,
        numberOfItemsInSection section:Int) -> Int
    {
        return 0
    }
    
    func collectionView(
        _ collectionView:UICollectionView,
        viewForSupplementaryElementOfKind kind:String,
        at indexPath:IndexPath) -> UICollectionReusableView
    {
        let reusable:UICollectionReusableView = reusableAtIndex(
            kind:kind,
            indexPath:indexPath)
        
        return reusable
    }
    
    func collectionView(
        _ collectionView:UICollectionView,
        cellForItemAt indexPath:IndexPath) -> UICollectionViewCell
    {
        let cell:Cell = cellAtIndex(indexPath:indexPath)
        
        return cell
    }
    
    func collectionView(
        _ collectionView:UICollectionView,
        shouldSelectItemAt indexPath:IndexPath) -> Bool
    {
        return true
    }
    
    func collectionView(
        _ collectionView:UICollectionView,
        shouldHighlightItemAt indexPath:IndexPath) -> Bool
    {
        return true
    }
    
    func collectionView(
        _ collectionView:UICollectionView,
        didSelectItemAt indexPath:IndexPath)
    {
        collectionView.isUserInteractionEnabled = false
        
        let deadline:DispatchTime = DispatchTime.now() + ViewMain.Constants.deselectTime
        DispatchQueue.main.asyncAfter(deadline:deadline)
        { [weak collectionView] in
            
            collectionView?.isUserInteractionEnabled = true
            collectionView?.selectItem(
                at:nil,
                animated:true,
                scrollPosition:UICollectionViewScrollPosition())
        }
    }
    
    func collectionView(
        _ collectionView:UICollectionView,
        didDeselectItemAt indexPath:IndexPath) { }
}
