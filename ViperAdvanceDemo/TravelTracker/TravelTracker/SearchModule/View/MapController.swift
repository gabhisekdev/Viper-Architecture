//
//  MapController.swift
//  TravelTracker
//
//  Created by Abhisek on 08/01/18.
//  Copyright © 2018 Abhisek. All rights reserved.
//

import UIKit
import GoogleMaps

class MapController: UIViewController {
  
  @IBOutlet weak var mapView: GMSMapView!
  @IBOutlet weak var addressLabel: UILabel!
  
  var routeToDisplay: GoogleRoute?
  
  override func viewDidLoad() {
    super.viewDidLoad()
    setUpUI()
  }
  
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }
  
  func setUpUI() {
    
    if let startAddress = routeToDisplay?.startAddress, let endAddres = routeToDisplay?.endAddress {
      addressLabel.text = startAddress.uppercased() + " to " + endAddres.uppercased()
    }
    navigationItem.title = "Route"
    setUpMapUI()
    
  }
  
  func setUpMapUI() {
    
    let startMarker = GMSMarker(position: CLLocationCoordinate2DMake((routeToDisplay?.startLocationCoordinate?.coordinate.latitude)!, (routeToDisplay?.startLocationCoordinate?.coordinate.longitude)!))
    startMarker.map = mapView
    
    let endMarker = GMSMarker(position: CLLocationCoordinate2DMake((routeToDisplay?.endLocationCoordinate?.coordinate.latitude)!, (routeToDisplay?.endLocationCoordinate?.coordinate.longitude)!))
    endMarker.map = mapView
    
    routeToDisplay?.polyLine?.strokeColor = .blue
    routeToDisplay?.polyLine?.strokeWidth = 5.0
    routeToDisplay?.polyLine?.map = mapView
    
    mapView.camera = GMSCameraPosition(target: CLLocationCoordinate2DMake((routeToDisplay?.startLocationCoordinate?.coordinate.latitude)!, (routeToDisplay?.startLocationCoordinate?.coordinate.longitude)!), zoom: 14.0, bearing: 0, viewingAngle: 0.0)
    
  }
  
}
