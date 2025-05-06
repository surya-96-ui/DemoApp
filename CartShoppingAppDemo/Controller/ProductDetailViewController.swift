//
//  ProductDetailViewController.swift
//  CartShoppingAppDemo
//
//  Created by Aniket Suryawanshi on 13/04/25.
//

import Foundation
import UIKit
class ProductDetailViewController : UIViewController {
    
    var cartProduct : CartItem!
    @IBOutlet weak var prodNameLabel: UILabel!
    @IBOutlet weak var prodDescLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        prodNameLabel.text = cartProduct.name
        prodDescLabel.text = cartProduct.description
        
    }
}
