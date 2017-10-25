import UIKit

extension VSettingsList
{
    //MARK: internal
    
    func config()
    {
        backgroundColor = UIColor.colourBackgroundGray
        collectionView.alwaysBounceVertical = true
        
        registerCell(
            cell:VSettingsListCellTravelMode.self)
        
        if let flow:VCollectionFlow = collectionView.collectionViewLayout as? VCollectionFlow
        {
            flow.minimumInteritemSpacing = kInterItem
            flow.minimumLineSpacing = kInterItem
            flow.sectionInset = UIEdgeInsets(
                top:kInsetsTop,
                left:0,
                bottom:kInsetsBottom,
                right:0)
        }
    }
}