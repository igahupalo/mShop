//
//  ProductViewController.swift
//  mShop
//
//  Created by Iga Hupalo on 24/04/2022.
//

import UIKit
import AVKit
import AVFoundation

class ProductViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var activityIndicatorView: UIActivityIndicatorView!

    var productId: Int?
    var product: Product?
    var getProductsUseCase: GetProductsUseCaseProtocol?
    var addToCartUseCase: AddToCartUseCaseProtocol?
    var productViewCellFactory: ProductViewCellFactory?


    override func viewDidLoad() {
        super.viewDidLoad()

        addToCartUseCase = AddToCartUseCase(cartRepository: CartRepository())

        if let getProductsUseCase = getProductsUseCase, let productId = productId {
            getProductsUseCase.getProduct(id: productId) { product in
                if let product = product {
                    self.product = product
                    self.productViewCellFactory = ProductViewCellFactory(tableView: self.tableView, product: product, productActionsDelegate: self, productVideoDelegate: self)
                    self.activityIndicatorView.stopAnimating()
                    self.tableView.reloadData()
                }
            }
        }
    }
}

extension ProductViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return productViewCellFactory?.numberOfRows() ?? 0
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = productViewCellFactory?.cellForRowAt(indexPath: indexPath) ?? UITableViewCell()
        return cell
    }
}

extension ProductViewController: ProductActionsDelegate {
    func didSelectAddToCartButton() {
        if let product = product {
            self.addToCartUseCase?.addToCart(product: product)
            self.displayAlert()
        }
    }

    private func displayAlert() {
        let message = "Added to cart"
        let alert = UIAlertController(title: message, message: nil, preferredStyle: .alert)
        self.present(alert, animated: true)
        let deadlineTime = DispatchTime.now() + .seconds(1)
        DispatchQueue.main.asyncAfter(deadline: deadlineTime, execute: {
            alert.dismiss(animated: true, completion: nil)
        })
    }
}

extension ProductViewController: ProductVideoDelegate {
    func playVideo() {
        let url = URL(string: "http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4")
        if let url = url {
            let player = AVPlayer(url: url)
            let playerViewController = AVPlayerViewController()
            playerViewController.player = player
            self.present(playerViewController, animated: true, completion: nil)
        }
    }
}


