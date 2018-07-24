//
//  MapViewController.swift
//  Capstone Project
//
//  Created by Crystal Wang on 7/23/18.
//  Copyright © 2018 Crystal Wang. All rights reserved.
//

import UIKit
import MapKit

class MapViewController: UIViewController {

    struct Location {
        let name: String
        let place: CLLocation
    }
    
    @IBOutlet weak var map: MKMapView!
    var nationalPark: String = ""
    let regionRadius: CLLocationDistance = 100000
    let initialLocations: [Location] = [
        Location(name: "Yosemite National Park", place: CLLocation(latitude: 37.865103, longitude: -119.538329)),
        Location(name: "Sequoia National Park", place: CLLocation(latitude: 36.486367, longitude: -118.565752)),
        Location(name: "Grand Canyon National Park", place: CLLocation(latitude: 36.106967, longitude: -112.112997))
    ]
    var currentPark: Int = 0
    
    func centerMapOnLocation(location: CLLocation) {
        let coordinateRegion = MKCoordinateRegionMakeWithDistance(location.coordinate, regionRadius, regionRadius)
        map.setRegion(coordinateRegion, animated: true)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let vc = segue.destination as? ExtraInfoViewController {
            vc.nationalPark = nationalPark
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        for number in 0...(initialLocations.count - 1) {
            if(initialLocations[number].name == nationalPark) {
                currentPark = number
            }
        }
        
        centerMapOnLocation(location: initialLocations[currentPark].place)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
