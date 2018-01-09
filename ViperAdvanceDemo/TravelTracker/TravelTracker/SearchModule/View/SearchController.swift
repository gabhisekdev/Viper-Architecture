//
//  ViewController.swift
//  TravelTracker
//
//  Created by Abhisek on 08/01/18.
//  Copyright © 2018 Abhisek. All rights reserved.
//

import UIKit

class SearchController: UIViewController {
  
  @IBOutlet weak var startLocationTextField: UITextField!
  @IBOutlet weak var endLocationTextField: UITextField!
  @IBOutlet weak var searchesTableView: UITableView!
  
  var presenter: SearchRoutePresenter = SearchRoutePresenter()//Instantiate the presenter for this module
  var savedSearches = [Route]()
  var dateFormatter = DateFormatter()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    presenter.viewRef = self //The view reference for presenter of this screen.
    presenter.viewDidLoad() //Inform the presenter about the view loading.
    dateFormatter.dateFormat = "dd-MM-YYYY"
    
  }
  
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }
  
  @IBAction func searchRoutesButtonPressed(_ sender: Any) {
    if startLocationTextField.text! == "" {
      Alert().showAlert(withMessage: "Please enter a start location.", title: "Error")
      return
    }
    
    if endLocationTextField.text! == "" {
      Alert().showAlert(withMessage: "Please enter an end location.", title: "Error")
      return
    }
    
    presenter.getRouteButtonPressedFor(from: startLocationTextField.text!, to: endLocationTextField.text!)
  }
  
  @IBAction func clearSavedDataBtnPressed(_ sender: Any) {
    presenter.clearSavedData()
    DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
      DispatchQueue.main.async { [weak self] in
        self?.savedSearches.removeAll()
        self?.searchesTableView.reloadData()
      }
    }
  }
  
}

//MARK: SearchPresenterProtocol
extension SearchController: SearchPresenterProtocol {
  
  func updateTheRecentSearchList(recentSavedSearchs: [Route]?, error: Error?) {
    guard let savedSearchResults = recentSavedSearchs else { return }
    savedSearches = savedSearchResults
    searchesTableView.reloadData()
  }
  
}

//MARK: UITableViewDataSource
extension SearchController: UITableViewDataSource {
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return savedSearches.count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    
    let cell = searchesTableView.dequeueReusableCell(withIdentifier: "SearchCell", for: indexPath)
    if let startLocation = savedSearches[indexPath.row].startLocation, let endLocation = savedSearches[indexPath.row].endLocation {
      cell.textLabel?.text =  startLocation + " - " + endLocation
    }
    
    if let dateSearched = savedSearches[indexPath.row].dateSearched as Date? {
      cell.detailTextLabel?.text = dateFormatter.string(from: dateSearched)
    }
    return cell
    
  }
  
}

//MARK: UITableViewDelegate
extension SearchController: UITableViewDelegate {
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    if let startLocation = savedSearches[indexPath.row].startLocation, let endLocation = savedSearches[indexPath.row].endLocation {
      presenter.getRouteButtonPressedFor(from: startLocation, to: endLocation)
    }
  }
}


