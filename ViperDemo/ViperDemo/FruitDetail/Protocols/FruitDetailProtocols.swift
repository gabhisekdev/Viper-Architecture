//
//  FruitDetailProtocols.swift
//  ViperDemo
//
//  Created by Abhisek on 08/11/17.
//  Copyright © 2017 Abhisek. All rights reserved.
//

import UIKit

protocol FruitDetailPresenterProtocol: class {
    
    var wireframe: FruitDetailWireFrameProtocol? {get set}
    var view: FruitDetailViewProtocol? {get set}
    
    //View -> Presenter
    func viewDidLoad()
    func backButtonPressed(from view: UIViewController)
    
}

protocol FruitDetailViewProtocol: class {
    //Presenter -> View
    func showFruitDetail(with fruit: Fruit)
}

protocol FruitDetailWireFrameProtocol: class {
    func goBackToFruitListView(from view: UIViewController)
}
