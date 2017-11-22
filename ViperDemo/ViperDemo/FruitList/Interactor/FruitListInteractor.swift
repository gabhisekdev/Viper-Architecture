//
//  FruitListInteractor.swift
//  ViperDemo
//
//  Created by Abhisek on 08/11/17.
//  Copyright © 2017 Abhisek. All rights reserved.
//

import UIKit

class FruitListInteractor: FruitListInputInteractorProtocol {
    
    var presenter: FruitListOutputInteractorProtocol?
    
    func getFruitList() {
        presenter?.fruitListDidFetch(fruitList: getAllFruitDetail())
    }
    
    func getAllFruitDetail() -> [Fruit] {
        
        var fruitList = [Fruit]()
        let allFruitDetail = Common.generateDataList()
        
        for item in allFruitDetail {
            fruitList.append(Fruit(attributes: item))
        }
        return fruitList
    }
}
