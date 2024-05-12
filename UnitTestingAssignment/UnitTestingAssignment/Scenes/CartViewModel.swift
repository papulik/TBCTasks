//
//  CartViewModel.swift
//  UnitTestingAssignment
//
//  Created by Chuck Norris on 11.05.1992.
//
import Foundation

final class CartViewModel {
    
    private let networkManager: NetworkManagerProtocol
    var allProducts: [Product] = []
    var selectedProducts: [Product] = []

    var selectedItemsQuantity: Int {
        return selectedProducts.reduce(0) { $0 + ($1.selectedQuantity ?? 0) }
    }

    var totalPrice: Double {
        return selectedProducts.reduce(0.0) { $0 + (Double($1.selectedQuantity ?? 0) * ($1.price ?? 0)) }
    }

    init(networkManager: NetworkManagerProtocol = NetworkManager.shared) {
        self.networkManager = networkManager
    }

    func viewDidLoad() {
        fetchProducts()
    }

    func fetchProducts() {
        networkManager.fetchProducts { [weak self] result in
            DispatchQueue.main.async {
                switch result {
                case .success(let products):
                    self?.allProducts = products!
                case .failure(let error):
                    print("Failed to fetch products: \(error.localizedDescription)")
                }
            }
        }
    }

    func addProduct(withID id: Int) {
        guard let product = allProducts.first(where: { $0.id == id }) else { return }
        addProduct(product: product)
    }

    func addProduct(product: Product) {
        if let index = selectedProducts.firstIndex(where: { $0.id == product.id }) {
            selectedProducts[index].selectedQuantity! += product.selectedQuantity!
        } else {
            var newProduct = product
            newProduct.selectedQuantity = product.selectedQuantity ?? 1
            selectedProducts.append(newProduct)
        }
    }

    func addRandomProduct() {
        guard let randomProduct = allProducts.randomElement() else { return }
        addProduct(product: randomProduct)
    }

    func removeProduct(withID id: Int) {
        selectedProducts.removeAll(where: { $0.id == id })
    }

    func clearCart() {
        selectedProducts.removeAll()
    }
}
