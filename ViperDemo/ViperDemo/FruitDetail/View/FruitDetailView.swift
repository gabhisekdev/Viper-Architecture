//
//  FruitDetailView.swift
//  ViperDemo
//
//  Created by Abhisek on 08/11/17.
//  Copyright © 2017 Abhisek. All rights reserved.
//

import UIKit

class FruitDetailView: UIViewController,FruitDetailViewProtocol {

    @IBOutlet var fruitImage: UIImageView!
    @IBOutlet var fruitNameLbl: UILabel!
    @IBOutlet var vitaminLbl: UILabel!
    
    var presenter: FruitDetailPresenterProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func showFruitDetail(with fruit: Fruit) {
        self.title = fruit.name
        self.fruitImage.image = UIImage(named: fruit.name)
        self.fruitNameLbl.text = fruit.name
        self.vitaminLbl.text = fruit.vitamin
    }

}
