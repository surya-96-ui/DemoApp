//
//  SecondViewControllerCell.swift
//  CartShoppingAppDemo
//
//  Created by Aniket Suryawanshi on 12/04/25.
//

import Foundation
import UIKit
class SecondViewControllerCell : UITableViewCell {
    
    
    @IBOutlet weak var productNameLabel: UILabel!
    @IBOutlet weak var productDescLabel: UILabel!
    @IBOutlet weak var productQuantity: UILabel!
    @IBOutlet weak var productPriceLabel: UILabel!
    
    var product: CartItem! {
        didSet {
            productNameLabel.text = product.name
            productDescLabel.text = product.description
            productPriceLabel.text = "\(product.price)"
            productQuantity.text = "\(product.quantity)"
        }
    }
}
