import UIKit

final class ViewCook:ViewMain<ArchCook>
{
    private weak var viewList:ViewCookList!
    private weak var layoutHeaderHeight:NSLayoutConstraint!
    private weak var layoutPlayLeft:NSLayoutConstraint!
    
    override func factoryViews()
    {
        super.factoryViews()
        self.shouldPanBack = true
        
        let viewHeader:ViewCookHeader = ViewCookHeader(controller:self.controller)
        
        let viewList:ViewCookList = ViewCookList(controller:self.controller)
        self.viewList = viewList
        
        let viewPlay:ViewCookPlay = ViewCookPlay(controller:self.controller)
        
        self.addSubview(viewList)
        self.addSubview(viewHeader)
        self.addSubview(viewPlay)
        
        NSLayoutConstraint.equals(
            view:viewList,
            toView:self)
        
        NSLayoutConstraint.topToTop(
            view:viewHeader,
            toView:self)
        layoutHeaderHeight = NSLayoutConstraint.height(
            view:viewHeader)
        NSLayoutConstraint.equalsHorizontal(
            view:viewHeader,
            toView:self)
        
        NSLayoutConstraint.bottomToBottom(
            view:viewPlay,
            toView:self,
            constant:ViewCook.Constants.playBottom)
        NSLayoutConstraint.size(
            view:viewPlay,
            constant:ViewCook.Constants.playSize)
        self.layoutPlayLeft = NSLayoutConstraint.leftToLeft(
            view:viewPlay,
            toView:self)
    }
    
    override func layoutSubviews()
    {
        self.adjustHeaderHeight()
        
        let width:CGFloat = self.bounds.width
        let playRemainLeft:CGFloat = width - ViewCook.Constants.playSize
        let playLeft:CGFloat = playRemainLeft / 2.0
        self.layoutPlayLeft.constant = playLeft
        
        super.layoutSubviews()
    }
    
    //MARK: internal
    
    func adjustHeaderHeight()
    {
        let width:CGFloat = self.bounds.width
        let offsetY:CGFloat = self.viewList.collectionView.contentOffset.y
        var headerHeight:CGFloat = width - offsetY
        
        if headerHeight < ViewCook.Constants.headerMinHeight
        {
            headerHeight = ViewCook.Constants.headerMinHeight
        }
        
        self.layoutHeaderHeight.constant = headerHeight
    }
}
