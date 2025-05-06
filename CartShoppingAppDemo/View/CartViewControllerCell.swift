//
//  CartViewControllerCell.swift
//  CartShoppingAppDemo
//
//  Created by Aniket Suryawanshi on 11/04/25.
//

import Foundation
import UIKit
class CartViewControllerCell : UITableViewCell {
    
    @IBOutlet weak var prodNameLabel: UILabel!
    @IBOutlet weak var prodDescLabel: UILabel!
    @IBOutlet weak var prodPriceLabel: UILabel!
    @IBOutlet weak var cartBtn: UIButton!
    @IBOutlet weak var cartMinusBtnClicked: UIButton!
    @IBOutlet weak var prodQty: UILabel!

    var cartProduct : CartItem! {
        didSet {
            prodNameLabel.text = cartProduct.name
            prodDescLabel.text = cartProduct.description
            prodPriceLabel.text = "\(cartProduct.price)"
            prodQty.text = "\(cartProduct.quantity)"
        }
    }
    
    
}
