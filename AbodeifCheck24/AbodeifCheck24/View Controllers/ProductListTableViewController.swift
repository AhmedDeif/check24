//
//  ProductListTableViewController.swift
//  AbodeifCheck24
//
//  Created by Ahmed Abodeif on 5/23/19.
//  Copyright © 2019 Ahmed Abodeif. All rights reserved.
//

import UIKit
import NVActivityIndicatorView


class ProductListTableViewController: UITableViewController {
    
    
    // The identifiers below must have the same name as nib names in Component/ProductListTable
    let productCellIdentifier = "ProductTableViewCell"
    let favoriteProductCellIdentifer = "FavoriteProductTableViewCell"
    let filterHeaderViewIdentifier = "ProductListFilterHeader"
    let viewModel: ProductListViewModel = ProductListViewModel()
    var productList: [Product] = []
 
    
    override func viewDidLoad() {
        super.viewDidLoad()
        registerTableViewCells()
        styleTableView()
        viewModelSetup()
        loadProducts()
        
    }

    func registerTableViewCells() {
        self.tableView.register(UINib(nibName: productCellIdentifier, bundle: nil), forCellReuseIdentifier: productCellIdentifier)
        self.tableView.register(UINib(nibName: favoriteProductCellIdentifer, bundle: nil), forCellReuseIdentifier: favoriteProductCellIdentifer)
        self.tableView.register(UINib(nibName: filterHeaderViewIdentifier, bundle: nil), forHeaderFooterViewReuseIdentifier: filterHeaderViewIdentifier)
    }
    
    func styleTableView() {
        tableView.separatorStyle = .none
    }
    
    func viewModelSetup() {
        viewModel.onProductListFetchSuccess = {
            NVActivityIndicatorPresenter.sharedInstance.stopAnimating(nil)
            self.productList = self.viewModel.productList
            self.tableView.reloadData()
        }
        // ToDo: implement onFetchFailure Handler
        viewModel.onProductListFetchFaild = { error in
            NVActivityIndicatorPresenter.sharedInstance.stopAnimating(nil)
        }
        
    }
    
    
    func loadProducts() {
        let activityData = ActivityData()
        NVActivityIndicatorPresenter.sharedInstance.startAnimating(activityData, nil)
        viewModel.getProducts()
    }
    
    func pushProductDetailsView(withProduct: Product) {
        let mainStoryboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = mainStoryboard.instantiateViewController(withIdentifier: "ProductDetailsViewController") as! ProductDetailsViewController
        vc.product = withProduct
        navigationController?.pushViewController(vc, animated: true)
    }
    
    // MARK: - Table view data source
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.productList.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        // ToDo: pass this control to viewModel in order to achieve complete seperation
        let productAvailable = productList[indexPath.row].available ?? false
    
        if productAvailable {
            let cell = tableView.dequeueReusableCell(withIdentifier: productCellIdentifier, for: indexPath) as!
            ProductTableViewCell
            cell.indexPath = indexPath
            cell.setCellData(withProduct: productList[indexPath.row], index: indexPath.row)
            return cell

        }
        else {
            let cell = tableView.dequeueReusableCell(withIdentifier: favoriteProductCellIdentifer, for: indexPath) as! FavoriteProductTableViewCell
            cell.indexPath = indexPath
            cell.setCellData(withProduct: productList[indexPath.row], index: indexPath.row)
            return cell
        }
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        pushProductDetailsView(withProduct: productList[indexPath.row])
    }
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = tableView.dequeueReusableHeaderFooterView(withIdentifier: filterHeaderViewIdentifier) as! ProductListFilterHeader
        // pass viewModel filter functions here 
        return headerView
    }
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 40
    }
   
 

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
