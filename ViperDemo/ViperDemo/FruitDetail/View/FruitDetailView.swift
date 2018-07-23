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
    
    weak var presenter: FruitDetailPresenterProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func showFruitDetail(with fruit: Fruit) {
        title = fruit.name
        fruitImage.image = UIImage(named: fruit.name)
        fruitNameLbl.text = fruit.name
        vitaminLbl.text = fruit.vitamin
    }

}
