import UIKit

class VStoreStatusReadyListCell:UICollectionViewCell
{
    weak var imageView:UIImageView!
    weak var labelTitle:UILabel!
    weak var labelDescr:UILabel!
    weak var layoutDescrHeight:NSLayoutConstraint!
    private(set) weak var controller:CStore?
    let attributesDescr:[NSAttributedStringKey:Any]
    let kImageHeight:CGFloat = 260
    let kTitleHeight:CGFloat = 90
    let kTitleFontSize:CGFloat = 18
    let kDescrMarginHorizontal:CGFloat = 20
    let kDescrTop:CGFloat = 10
    let kDescrMaxHeight:CGFloat = 300
    private let kDescrFontSize:CGFloat = 14
    
    override init(frame:CGRect)
    {
        attributesDescr = VStoreStatusReadyListCell.factoryAttributesDescr(
            fontSize:kDescrFontSize)
        
        super.init(frame:frame)
        backgroundColor = UIColor.white
        clipsToBounds = true
        
        factoryViews()
    }
    
    required init?(coder:NSCoder)
    {
        return nil
    }
    
    //MARK: internal
    
    func config(
        controller:CStore,
        model:MStorePerkProtocol)
    {
        self.controller = controller
        imageView.image = model.icon
        labelTitle.text = model.title
        
        addDescr(model:model)
    }
}