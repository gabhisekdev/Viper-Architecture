//
//  FruitDetailWireFrame.swift
//  ViperDemo
//
//  Created by Abhisek on 08/11/17.
//  Copyright © 2017 Abhisek. All rights reserved.
//

import UIKit

class FruitDetailWireFrame: FruitDetailWireFrameProtocol {
    
    class func createFruitDetailModule(with fruitDetailRef: FruitDetailView, and fruit: Fruit) {
        
        let presenter = FruitDetailPresenter()
        presenter.fruit = fruit
        fruitDetailRef.presenter = presenter
        fruitDetailRef.presenter?.view = fruitDetailRef
        fruitDetailRef.presenter?.wireframe = FruitDetailWireFrame()
        
    }
    
    func goBackToFruitListView(from view: UIViewController) {
        
    }
    

}
