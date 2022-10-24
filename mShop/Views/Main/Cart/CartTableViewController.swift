//
//  CartViewController.swift
//  mShop
//
//  Created by Iga Hupalo on 20/04/2022.
//

import UIKit

class CartTableViewController: UITableViewController {

    var getCartUseCase: GetCartUseCaseProtocol?
    var deleteCartPositionUseCase: DeleteCartPositionUseCaseProtocol?
    var updateCartPositionQuantityUseCase: UpdateCartPositionQuantityUseCaseProtocol?
    var cartPositions: [CartPosition] = []


    override func viewDidLoad() {
        super.viewDidLoad()
        let cartRepository = CartRepository()
        getCartUseCase = GetCartUseCase(cartRepository: cartRepository)
        deleteCartPositionUseCase = DeleteCartPositionUseCase(cartRepository: cartRepository)
        updateCartPositionQuantityUseCase = UpdateCartPositionQuantityUseCase(cartRepository: cartRepository)
    }

    override func viewWillAppear(_ animated: Bool) {
        cartPositions = getCartUseCase?.getCart() ?? []
        tableView.reloadData()
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cartPostionTableViewCell", for: indexPath) as! CartPositionTableViewCell
        cell.setDelegate(delegate: self)
        cell.setCartPosition(cartPosition: cartPositions[indexPath.row])
        cell.setIndexPath(indexPath: indexPath)
        return cell
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cartPositions.count
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}

extension CartTableViewController: CartPositionTableViewCellDelegate {
    func updateCartPositionQuantity(cartPosition: CartPosition, quantity: Int) {
        updateCartPositionQuantityUseCase?.updateCartPositionQuantity(productId: cartPosition.productId, quantity: quantity)
    }

    func deleteCartPosition(indexPath: IndexPath) {
        deleteCartPositionUseCase?.deleteCartPosition(productId: cartPositions[indexPath.row].productId)
        cartPositions.remove(at: indexPath.row)
        tableView.deleteRows(at: [indexPath], with: .fade)
    }
}
