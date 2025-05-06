//
//  ViewController.swift
//  CartShoppingAppDemo
//
//  Created by Aniket Suryawanshi on 11/04/25.
//

import UIKit

class ViewController: UIViewController {
    
   
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var totalProducts: UILabel!
    @IBOutlet weak var totalPrice: UILabel!
    
    
    let cartViewModel = CartViewModel()
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        cartViewModel.fetchProducts()
        updateTotalProductsPrice()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        tableView.reloadData()
        updateTotalProductsPrice()
    }

    @objc func cartBtnClicked (_ sender : UIButton) {
        let index = sender.tag
        var item = cartViewModel.cartList[index]
        item.quantity += 1
        item.price = item.unitPrice * Double(item.quantity)
        cartViewModel.cartList[index] = item
        tableView.reloadRows(at: [IndexPath(row: index, section: 0)], with: .none)
        updateTotalProductsPrice()
    }
    
    @IBAction func gotoCartClicked(_ sender: UIBarButtonItem) {
        let secondVc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "SecondViewControllerID") as! SecondViewController
        secondVc.cartViewModel = self.cartViewModel
        self.navigationController?.pushViewController(secondVc, animated: true)
    }
    
    @objc func cartMinusBtnClicked (_ sender : UIButton) {
        let index = sender.tag
        var item = cartViewModel.cartList[index]
        if item.quantity > 1 {
            item.quantity -= 1
            item.price = item.unitPrice * Double(item.quantity)
            cartViewModel.cartList[index] = item
        } else {
            cartViewModel.cartList.remove(at: index)
        }
        tableView.reloadData()
        updateTotalProductsPrice()
    }
    
    func updateTotalProductsPrice() {
        totalProducts.text = cartViewModel.showTotalProdQtys()
        totalPrice.text = cartViewModel.showTotalPrice()
    }
    
}

extension ViewController : UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        cartViewModel.totalProducts()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CartViewControllerCell") as! CartViewControllerCell
        cell.cartProduct = cartViewModel.cartList[indexPath.row]
        cell.cartBtn.tag = indexPath.row
        cell.cartBtn.addTarget(self, action: #selector(cartBtnClicked(_:)), for: .touchUpInside)
        cell.cartMinusBtnClicked.tag = indexPath.row
        cell.cartMinusBtnClicked.addTarget(self, action: #selector(cartMinusBtnClicked(_:)), for: .touchUpInside)
        cell.accessoryType = .disclosureIndicator
        return cell
        
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let item = cartViewModel.cartList[indexPath.row]
        let productDetailsVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "ProductDetailViewControllerID") as! ProductDetailViewController
        productDetailsVC.cartProduct = item
        self.navigationController?.pushViewController(productDetailsVC, animated: true)
    }
}

