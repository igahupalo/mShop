//
//  ProductListViewController.swift
//  mShop
//
//  Created by Iga Hupalo on 25/04/2022.
//

import UIKit

class ProductListViewController: UIViewController {
    @IBOutlet weak var productsTableView: UITableView!
    @IBOutlet weak var activityIndicatorView: UIActivityIndicatorView!

    var products: [Product]?
    var category: Category?

    var getProductsUseCase: GetProductsUseCaseProtocol = GetProductsUseCase(productRepository: ProductRepository())
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    func setCategory(_ category: Category) {
        self.category = category
        navigationItem.title = category.title
        getProductsUseCase.getProducts(category: category) { products in
            let multiplied: [Product] = (products + products + products + products + products +
                                products + products + products + products + products +
                                products + products + products + products + products +
                                products + products + products + products + products +
                                products + products + products + products + products)

            self.products = multiplied
            self.activityIndicatorView.stopAnimating()
//            DatabaseConfig.time4 = Date().millisecondsSince1970
            self.productsTableView.reloadData()
        }

    }
}

extension ProductListViewController: UITableViewDataSource, UITableViewDelegate {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return products?.count ?? 0
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = productsTableView.dequeueReusableCell(withIdentifier: "productTableViewCell", for: indexPath) as! ProductTableViewCell

        if let product = products?[indexPath.row] {
            cell.setProduct(product)
        }

//        if let rows = products?.count, indexPath.row == rows - 1 {
//            DatabaseConfig.time5 = Date().millisecondsSince1970
//            print(String(DatabaseConfig.time1) + ";" +
//                  String(DatabaseConfig.time2) + ";" +
//                  String(DatabaseConfig.time3) + ";" +
//                  String(DatabaseConfig.time4) + ";" +
//                  String(DatabaseConfig.time5))
//        }

        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

        let productId = products?[indexPath.row].id

        let productStoryboard = UIStoryboard(name: "Product", bundle: nil)
        if let viewController = productStoryboard.instantiateViewController(identifier: "ProductViewController") as? ProductViewController {
            viewController.productId = productId
            viewController.getProductsUseCase = self.getProductsUseCase
            tableView.deselectRow(at: indexPath, animated: false)
            navigationController?.pushViewController(viewController, animated: true)
        }
    }
}
