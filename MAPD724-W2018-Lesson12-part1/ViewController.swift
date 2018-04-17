

import UIKit
import  MapKit

class ViewController: UIViewController {
   
    
    @IBOutlet weak var map: MKMapView!
    
    @IBOutlet weak var textLatitude: UITextField!
    @IBOutlet weak var textLongitude: UITextField!
    
    @IBOutlet weak var magnificationText: UILabel!
    
    //To Fix
    let Latitude = 43.6532
    let Longitude = -79.3832
    var delta = 5.0
    
   
    override func viewDidLoad() {
        super.viewDidLoad()
 
        
        
     /*   let location  = CLLocationCoordinate2DMake(Latitude, Longitude)
        let span = MKCoordinateSpan(latitudeDelta: delta, longitudeDelta: delta)
        let reg = MKCoordinateRegionMake(location, span)
        self.map.region = reg
        
        let ann = MKPointAnnotation()
        ann.coordinate = self.mapLocation
        ann.title = "Toronto"
        ann.subtitle = "A Place that's really cool"
        self.map.addAnnotation(ann) */
    }

    @IBAction func seeinMapApp(_ sender: UIButton) {
        let placemark = MKPlacemark(coordinate: CLLocationCoordinate2DMake((textLatitude.text as! NSString).doubleValue, (textLongitude.text as! NSString).doubleValue), addressDictionary: nil)
        let mapitem = MKMapItem(placemark: placemark)
        mapitem.name = "A really icy place"
        
        //opens our location in map app
        mapitem.openInMaps(launchOptions: [
            MKLaunchOptionsMapTypeKey: MKMapType.standard.rawValue,
            MKLaunchOptionsMapCenterKey: self.map.region.center,
            MKLaunchOptionsMapSpanKey: self.map.region.span
            ])
    }
    
    
    @IBAction func searchLocation(_ sender: UIButton) {
        
        let location  = CLLocationCoordinate2DMake((textLatitude.text as! NSString).doubleValue, (textLongitude.text as! NSString).doubleValue)
        
        let span = MKCoordinateSpan(latitudeDelta: (magnificationText.text as! NSString).doubleValue, longitudeDelta: (magnificationText.text as! NSString).doubleValue)
        let reg = MKCoordinateRegionMake(location, span)
        self.map.region = reg
        
        let ann = MKPointAnnotation()
        ann.coordinate = location
        ann.title = "Toronto"
        ann.subtitle = "A Place that's really cool"
        self.map.addAnnotation(ann)
        
    }
    
    
    @IBAction func magnificationMonitor(_ sender: UIStepper) {
        magnificationText.text = Int(sender.value).description
    }
    
}

