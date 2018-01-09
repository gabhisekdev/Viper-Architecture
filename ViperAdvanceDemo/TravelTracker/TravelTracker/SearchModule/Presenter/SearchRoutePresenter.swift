//
//  SearchRoutePresenter.swift
//  TravelTracker
//
//  Created by Abhisek on 08/01/18.
//  Copyright © 2018 Abhisek. All rights reserved.
//

import UIKit

class SearchRoutePresenter: SearchViewProtocol {
  
  var viewRef: SearchController?//View reference of the main screen of this module i.e SearchController
  var searchRouteWireframe: SearchRouteWireframe? //Router reference for this module.
  var searchInteractor: SearchRouteInteractor? // Interactor reference for this module.
  
  func viewDidLoad() {
    SearchRouteWireframe.loadSearchPageComponents(withPresenter: self)//Load all the components for this module
    searchInteractor?.fetchGetRecentSearches() //Ask the interactor to update fetch the recent searches made by user.
  }
  
  func getRouteButtonPressedFor(from startLocation: String, to endLocation: String) {
    searchInteractor?.getRoute(from: startLocation, to: endLocation) //Ask the interactor to update fetch the route between start and end loacation.
    searchInteractor?.fetchGetRecentSearches()
  }
  
  func clearSavedData() {
    searchInteractor?.clearSavedSearches()//Clear saved searches.
    viewRef?.updateTheRecentSearchList(recentSavedSearchs: nil,error: nil)
  }
  
}

extension SearchRoutePresenter: SearchInteractorOutputProtocol {
  
  //Called when the recent searches done by user is fetched from local DB
  func didFinishFetchingRecentSearchResults(allSearches: [Route]?, error: Error?) {
    guard let searchResults = allSearches else {
      return
    }
    viewRef?.updateTheRecentSearchList(recentSavedSearchs: searchResults,error: nil) //Ask the view to update the recent search list
  }
  
  //Called when the route detail has been fetched from the server
  func routeDetailFetched(route: GoogleRoute?,errorMessage: String?) {
    guard let sourceController = viewRef, let routeToBeshown = route else {
      if errorMessage != nil {
        Alert().showAlert(withMessage: "There is a problem in fetching route. Please try again.", title: "Error")
      }
      return
    }
    searchRouteWireframe?.showRouteInMap(from: sourceController, withRoute: routeToBeshown)//Ask the router to show the fetched route in map.
  }
  
}


