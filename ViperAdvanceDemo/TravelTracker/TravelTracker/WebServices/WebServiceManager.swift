//
//  WebServiceManager.swift
//  TravelTracker
//
//  Created by Anthony on 08/01/18.
//  Copyright © 2018 Abhisek. All rights reserved.
//

import UIKit

class WebServiceManager: NSObject {
  
  static let sharedService = WebServiceManager()
  
  typealias WebServiceCompletionBlock = (_ data: [String:AnyObject]?,_ error: Error?)->Void
  
  enum HTTPMethodType: Int {
    case POST = 0
    case GET
  }
  
  func requestAPI(url: String,parameter: [String: AnyObject]?, httpMethodType: HTTPMethodType, completion: @escaping WebServiceCompletionBlock) {
    
    let escapedAddress = url.addingPercentEncoding(withAllowedCharacters: CharacterSet.urlQueryAllowed)
    var request = URLRequest(url: URL(string: escapedAddress!)!)
    
    switch httpMethodType {
    case .POST:
      request.httpMethod = "POST"
    case .GET:
      request.httpMethod = "GET"
      
      if parameter != nil{
        do {
          request.httpBody = try JSONSerialization.data(withJSONObject: parameter as Any, options: .prettyPrinted)
        } catch let error {
          print(error.localizedDescription)
        }
      }
      
      let task = URLSession.shared.dataTask(with: request) { data, response, error in
        
        guard let data = data, error == nil else {                                                                 return
        }
        
        if let httpStatus = response as? HTTPURLResponse, httpStatus.statusCode != 200 {           // check for http errors
          print("Error in fetching response")
        }
        
        do {
          //create json object from data
          if let json = try JSONSerialization.jsonObject(with: data, options: .mutableContainers) as? [String: Any] {
            completion(json as [String : AnyObject],nil)
          }
        } catch let error {
          print(error.localizedDescription)
          completion(nil,error)
        }
        
      }
      task.resume()
      
    }
    
  }
  

}
