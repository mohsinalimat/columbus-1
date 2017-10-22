import MapKit

final class VCreateStatusReadyMap:MKMapView
{
    private(set) weak var controller:CCreate!
    var shouldUpdate:Bool
    let span:MKCoordinateSpan
    private let kSpanSize:CLLocationDegrees = 0.03
    
    init(controller:CCreate)
    {
        shouldUpdate = true
        span = MKCoordinateSpan(
            latitudeDelta:kSpanSize,
            longitudeDelta:kSpanSize)
        
        super.init(frame:CGRect.zero)
        clipsToBounds = true
        translatesAutoresizingMaskIntoConstraints = false
        isRotateEnabled = false
        isScrollEnabled = true
        isZoomEnabled = true
        isPitchEnabled = false
        mapType = MKMapType.standard
        showsBuildings = true
        showsPointsOfInterest = true
        showsCompass = true
        showsScale = true
        showsTraffic = false
        showsUserLocation = true
        userTrackingMode = MKUserTrackingMode.follow
        delegate = self
        self.controller = controller
    }
    
    required init?(coder:NSCoder)
    {
        return nil
    }
}
