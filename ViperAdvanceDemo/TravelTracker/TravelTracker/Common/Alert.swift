//
//  Alert.swift
//  TravelTracker
//
//  Created by Abhisek on 09/01/18.
//  Copyright © 2018 Abhisek. All rights reserved.
//

import Foundation
import UIKit

struct Alert {
  
  let rootController: UIViewController? = {
    let app = UIApplication.shared.delegate as! AppDelegate
    return app.window?.rootViewController
  }()
  
  let activityIndicator = UIActivityIndicatorView()
  
  func showAlert(withMessage message: String, title: String) {
    
    let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
    let okAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
    alertController.addAction(okAction)
    rootController?.present(alertController, animated: true, completion: nil)
    
  }
  
  func showLoader() {
    activityIndicator.frame = CGRect(x: 0, y: 0, width: 40, height: 40)
    activityIndicator.center = (rootController?.view.center)!
    activityIndicator.hidesWhenStopped = true
    activityIndicator.activityIndicatorViewStyle =
      UIActivityIndicatorViewStyle.whiteLarge
    rootController?.view.addSubview(activityIndicator)
    activityIndicator.startAnimating()
    UIApplication.shared.beginIgnoringInteractionEvents()
  }
  
  func hideLoader() {
    activityIndicator.removeFromSuperview()
    UIApplication.shared.endIgnoringInteractionEvents()
  }
  
  
}
