import UIKit

final class MSettingsTravelMode:MSettingsProtocol
{
    let reusableIdentifier:String = VSettingsListCellTravelMode.reusableIdentifier
    let cellHeight:CGFloat = 200
    private(set) weak var settings:DSettings!
    private(set) weak var database:Database!
    
    init(
        settings:DSettings,
        database:Database)
    {
        self.settings = settings
        self.database = database
    }
}
