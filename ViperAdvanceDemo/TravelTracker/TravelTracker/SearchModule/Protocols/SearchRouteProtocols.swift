//
//  HomeScreenProtocols.swift
//  TravelTracker
//
//  Created by Abhisek on 08/01/18.
//  Copyright © 2018 Abhisek. All rights reserved.
//

import Foundation
import UIKit

protocol SearchViewProtocol {
  
  var viewRef: SearchController? {get set}
  var searchRouteWireframe: SearchRouteWireframe? {get set}
  var searchInteractor: SearchRouteInteractor? {get set}
  //View -> Presenter
  func viewDidLoad()
  func getRouteButtonPressedFor(from startLocation: String, to endLocation: String)
  
}

protocol SearchPresenterProtocol {
  //Presenter -> View
  func updateTheRecentSearchList(recentSavedSearchs: [Route]?, error: Error?)
}

protocol SearchInteractorInputProtocol {
  var presenter: SearchRoutePresenter? {get set}
  //Presenter -> Interactor
  func fetchGetRecentSearches()
  func getRoute(from startLocation: String, to endLocation: String)
}

protocol SearchInteractorOutputProtocol {
  //Interactor -> Protocol
  func didFinishFetchingRecentSearchResults(allSearches: [Route]?,error: Error?)
  func routeDetailFetched(route: GoogleRoute?,errorMessage: String?)
  
}

protocol SearchWireframeProtocol {
  //Presenter -> Wireframe
  func showRouteInMap(from controller: SearchController, withRoute route: GoogleRoute)
}
