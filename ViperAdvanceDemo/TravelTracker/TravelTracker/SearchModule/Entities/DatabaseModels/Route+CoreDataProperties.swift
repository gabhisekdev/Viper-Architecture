//
//  Route+CoreDataProperties.swift
//  TravelTracker
//
//  Created by Abhisek on 09/01/18.
//  Copyright © 2018 Abhisek. All rights reserved.
//
//

import Foundation
import CoreData


extension Route {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Route> {
        return NSFetchRequest<Route>(entityName: "Route")
    }

    @NSManaged public var endLocation: String?
    @NSManaged public var startLocation: String?
    @NSManaged public var dateSearched: NSDate?

}
