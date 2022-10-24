//
//  SearchViewController.swift
//  mShop
//
//  Created by Iga Hupalo on 20/04/2022.
//

import UIKit

class SearchViewController: UIViewController {
    @IBOutlet weak var categoriesTableView: UITableView!
    @IBOutlet weak var activityIndicatorView: UIActivityIndicatorView!

    let getCategoriesUseCase: GetCategoriesUseCaseProtocol = GetCategoriesUseCase(categoryRepository: CategoryRepository())
    var categories: [Category] = []

    override func viewDidLoad() {
        super.viewDidLoad()

        getCategoriesUseCase.getAllCategories { categories in
            self.categories = categories
            self.activityIndicatorView.stopAnimating()
            self.categoriesTableView.reloadData()
        }
    }
}

extension SearchViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return categories.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "categoryTableViewCell", for: indexPath) as! CategoryTableViewCell

        cell.setCategory(category: categories[indexPath.row])

        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        DatabaseConfig.time1 = Date().millisecondsSince1970
        let productListStoryboard = UIStoryboard(name: "ProductList", bundle: nil)
        if let viewController = productListStoryboard.instantiateViewController(identifier: "ProductListViewController") as? ProductListViewController {
            viewController.setCategory(categories[indexPath.row])
            navigationController?.pushViewController(viewController, animated: true)
            tableView.deselectRow(at: indexPath, animated: false)
        }
    }
}

