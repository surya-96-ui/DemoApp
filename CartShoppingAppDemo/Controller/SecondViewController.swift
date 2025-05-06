//
//  SecondViewController.swift
//  CartShoppingAppDemo
//
//  Created by Aniket Suryawanshi on 12/04/25.
//

import Foundation
import UIKit
class SecondViewController : UIViewController{
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var placeOrderBtn: UIButton!
    weak var cartViewModel : CartViewModel?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        if cartViewModel?.totalCartAddedProducts() == 0 {
            tableView.isHidden = true
            placeOrderBtn.setTitle("Go To Home", for: .normal)
        }
    }
    
    @IBAction func placeOrderBtnClicked(_ sender: Any) {
        tableView.isHidden = true
        placeOrderBtn.setTitle("Go To Home", for: .normal)
        if placeOrderBtn.titleLabel?.text == "Go To Home" {
            cartViewModel?.resetProducts()
            self.navigationController?.popViewController(animated: true)
        }
    }
}

extension SecondViewController : UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        cartViewModel?.totalCartAddedProducts() ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "SecondViewControllerCell") as! SecondViewControllerCell
        let quantity = cartViewModel?.cartList[indexPath.row].quantity ?? 0
        if quantity > 1 {
            cell.product = cartViewModel?.cartList[indexPath.row]
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
}
