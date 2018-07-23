//
//  FruitListPresenter.swift
//  ViperDemo
//
//  Created by Abhisek on 08/11/17.
//  Copyright © 2017 Abhisek. All rights reserved.
//

import UIKit

class FruitListPresenter: FruitListPresenterProtocol {
    
    weak var wireframe: FruitListWireFrameProtocol?
    weak var view: FruitListViewProtocol?
    weak var interactor: FruitListInputInteractorProtocol?
    weak var presenter: FruitListPresenterProtocol?
    
    func showFruitSelection(with fruit: Fruit, from view: UIViewController) {
        wireframe?.pushToFruitDetail(with: fruit, from: view)
    }
    
    func viewDidLoad() {
        self.loadFruitList()
    }

    func loadFruitList() {
        interactor?.getFruitList()
    }
    
}

extension FruitListPresenter: FruitListOutputInteractorProtocol {
    
    func fruitListDidFetch(fruitList: [Fruit]) {
        view?.showFruits(with: fruitList)
    }
    
}
