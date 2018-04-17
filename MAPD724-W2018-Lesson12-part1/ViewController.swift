

import UIKit
import  MapKit

class ViewController: UIViewController {
   
    
    @IBOutlet weak var map: MKMapView!
    
    //To Fix
    let Latitude = 43.6532
    let Longitude = -79.3832
    var delta = 5.0
    
    let mapLocation = CLLocationCoordinate2DMake(43.6532, -79.3832)

    override func viewDidLoad() {
        super.viewDidLoad()
 
        let location  = CLLocationCoordinate2DMake(Latitude, Longitude)
        let span = MKCoordinateSpan(latitudeDelta: delta, longitudeDelta: delta)
        let reg = MKCoordinateRegionMake(location, span)
        self.map.region = reg
        
        let ann = MKPointAnnotation()
        ann.coordinate = self.mapLocation
        ann.title = "Toronto"
        ann.subtitle = "A Place that's really cool"
        self.map.addAnnotation(ann)
    }

    @IBAction func seeinMapApp(_ sender: UIButton) {
        let placemark = MKPlacemark(coordinate: self.mapLocation, addressDictionary: nil)
        let mapitem = MKMapItem(placemark: placemark)
        mapitem.name = "A really icy place"
        
        //opens our location in map app
        mapitem.openInMaps(launchOptions: [
            MKLaunchOptionsMapTypeKey: MKMapType.standard.rawValue,
            MKLaunchOptionsMapCenterKey: self.map.region.center,
            MKLaunchOptionsMapSpanKey: self.map.region.span
            ])
    }
    

}

