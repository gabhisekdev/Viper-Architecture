//
//  SearchRouteInteractor.swift
//  TravelTracker
//
//  Created by Abhisek on 08/01/18.
//  Copyright © 2018 Abhisek. All rights reserved.
//

import UIKit
import CoreData

class SearchRouteInteractor: SearchInteractorInputProtocol {
  
  var presenter: SearchRoutePresenter?
  
  //Get recent searches by user from local database
  func fetchGetRecentSearches() {
    
    let managedObjectContext = CDManager.sharedDatabaseManager.persistentContainer.viewContext
    let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "Route")
    do {
      let savedSearchRsults = try managedObjectContext.fetch(fetchRequest) as! [Route]
      presenter?.didFinishFetchingRecentSearchResults(allSearches: savedSearchRsults, error: nil)
    } catch let error as NSError {
      print("Could not fetch. \(error), \(error.userInfo)")
      presenter?.didFinishFetchingRecentSearchResults(allSearches: nil, error: error)
    }
    
  }
  
  //Get route from one location to another as provided by the user
  func getRoute(from startLocation: String, to endLocation: String) {
    
    saveSearch(from: startLocation, to: endLocation)
    let googleDirectionsURL = WebServiceAPIPaths.googleDirectionsAPIPath + "origin=\(startLocation)&destination=\(endLocation)&mode=driving&key=\(GoogleAPIConstants.key)"

    WebServiceManager.sharedService.requestAPI(url: googleDirectionsURL, parameter: nil, httpMethodType: .GET) { (response, error) in
      DispatchQueue.main.async {
        guard let data = response else {
          self.presenter?.routeDetailFetched(route: nil, errorMessage: error?.localizedDescription)
          return
        }
        let routeList = data["routes"] as! [[String: AnyObject]]
        if routeList.count > 0 {
          self.presenter?.routeDetailFetched(route: GoogleRoute(routeAttributes: routeList[0]), errorMessage: nil)
        } else {
          self.presenter?.routeDetailFetched(route: nil, errorMessage: "No route found")
        }
        
      }
    }
    
  }
  
  //Save the searches from user to local database
  func saveSearch(from startLocation: String, to endLocation: String) {
    
    let managedObjectContext = CDManager.sharedDatabaseManager.persistentContainer.viewContext
    let entity = NSEntityDescription.insertNewObject(forEntityName: "Route", into: managedObjectContext) as! Route
    entity.startLocation = startLocation
    entity.endLocation = endLocation
    entity.dateSearched = Date() as NSDate
    CDManager.sharedDatabaseManager.saveContext()
    
  }
  
  func clearSavedSearches() {
    
    let managedObjectContext = CDManager.sharedDatabaseManager.persistentContainer.viewContext
    let deleteFetch = NSFetchRequest<NSFetchRequestResult>(entityName: "Route")
    let deleteRequest = NSBatchDeleteRequest(fetchRequest: deleteFetch)
    
    do {
      try managedObjectContext.execute(deleteRequest)
      try managedObjectContext.save()
    } catch {
      print ("There was an error")
    }
    
  }
  
  
}
