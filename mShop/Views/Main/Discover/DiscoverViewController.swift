//
//  DiscoverViewController.swift
//  mShop
//
//  Created by Iga Hupalo on 20/04/2022.
//

import UIKit

class DiscoverViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!

    var discoverCellFactory: DiscoverCellFactory?
    let getProductsUseCase: GetProductsUseCaseProtocol = GetProductsUseCase(productRepository: ProductRepository())

    override func viewDidLoad() {
        super.viewDidLoad()
        discoverCellFactory = DiscoverCellFactory(tableView: tableView, specialOffersDelegate: self)
    }
}

extension DiscoverViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return discoverCellFactory?.numberOfRows() ?? 0
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return discoverCellFactory?.cellForRowAt(indexPath: indexPath) ?? UITableViewCell()
    }
}

extension DiscoverViewController: SpecialOffersTableViewCellDelegate {
    func didSelectProduct(productId: Int) {
        let productStoryboard = UIStoryboard(name: "Product", bundle: nil)
        if let viewController = productStoryboard.instantiateViewController(identifier: "ProductViewController") as? ProductViewController {
            viewController.productId = productId
            viewController.getProductsUseCase = self.getProductsUseCase
            navigationController?.pushViewController(viewController, animated: true)
        }
    }
}
