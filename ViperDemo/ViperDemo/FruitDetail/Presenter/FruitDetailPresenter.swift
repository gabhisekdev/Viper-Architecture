//
//  FruitDetailPresenter.swift
//  ViperDemo
//
//  Created by Abhisek on 08/11/17.
//  Copyright © 2017 Abhisek. All rights reserved.
//

import UIKit

class FruitDetailPresenter: FruitDetailPresenterProtocol {
    
    weak var view: FruitDetailViewProtocol?
    weak var wireframe: FruitDetailWireFrameProtocol?
    var fruit: Fruit?
    
    func viewDidLoad() {
        view?.showFruitDetail(with: fruit!)
    }
    
    func backButtonPressed(from view: UIViewController) {
        
    }
    
}
