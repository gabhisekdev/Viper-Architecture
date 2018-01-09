//
//  GoogleRoute.swift
//  TravelTracker
//
//  Created by Anthony on 08/01/18.
//  Copyright © 2018 Abhisek. All rights reserved.
//

import Foundation
import GoogleMaps

struct GoogleRoute {
  
  var polyLine: GMSPolyline?
  var distance: String?
  var duration: String?
  var startAddress: String?
  var endAddress: String?
  
  var startLocationCoordinate: CLLocation?
  var endLocationCoordinate: CLLocation?
  
  init(routeAttributes: [String: AnyObject]) {
    
    if let legs = routeAttributes["legs"] as? [[String: AnyObject]] {
      distance = (legs[0]["distance"] as! [String: AnyObject])["text"] as? String
      duration = (legs[0]["duration"] as! [String: AnyObject])["text"] as? String
      if let start_address = legs[0]["start_address"] as? String {
        startAddress = start_address
      }
      
      if let end_address = legs[0]["end_address"] as? String {
        endAddress = end_address
      }
      
      if let end_location = legs[0]["end_location"] as? [String: AnyObject], let startLocation = legs[0]["start_location"] as? [String: AnyObject] {
        
        let startLat = startLocation["lat"] as! Double
        let startLong = startLocation["lng"] as! Double
        startLocationCoordinate = CLLocation(latitude: startLat, longitude: startLong)
        
        let endLat = end_location["lat"] as! Double
        let endLong = end_location["lng"] as! Double
        endLocationCoordinate = CLLocation(latitude: endLat, longitude: endLong)
        
      }
      
    }
    
    if let overview_polyline = routeAttributes["overview_polyline"] as? [String: AnyObject] {
      guard let encodedString = overview_polyline["points"] as? String else {return}
      polyLine = generatePolyline(encodedString: encodedString)
    }
    
  }
  
  func generatePolyline(encodedString: String)->GMSPolyline {
    
    let path = GMSMutablePath(fromEncodedPath: encodedString)
    let polyline = GMSPolyline(path: path)
    return polyline
    
  }
  
}
