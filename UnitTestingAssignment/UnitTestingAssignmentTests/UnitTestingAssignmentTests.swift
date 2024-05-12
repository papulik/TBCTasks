//
//  UnitTestingAssignmentTests.swift
//  UnitTestingAssignmentTests
//
//  Created by Zuka Papuashvili on 12.05.24.
//

import XCTest
@testable import UnitTestingAssignment

final class CartViewModelTests: XCTestCase {
    
    var viewModel: CartViewModel!
    var mockNetworkManager: MockNetworkManager!
    
    override func setUpWithError() throws {
        mockNetworkManager = MockNetworkManager()
        viewModel = CartViewModel(networkManager: mockNetworkManager)
    }
    
    override func tearDownWithError() throws {
        viewModel = nil
        mockNetworkManager = nil
    }
    
    func testFetchProductsSuccess() {
        mockNetworkManager.products = [Product(id: 1, title: "iPhone", description: "A phone", price: 999, selectedQuantity: 1)]
        
        let expectation = self.expectation(description: "Fetching products succeeds")
        
        viewModel.fetchProducts()
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
            XCTAssertEqual(self.viewModel.allProducts.count, 1)
            XCTAssertEqual(self.viewModel.allProducts.first?.title, "iPhone")
            expectation.fulfill()
        }
        
        wait(for: [expectation], timeout: 2.0)
    }
    
    func testFetchProductsFailure() {
        mockNetworkManager.error = NSError(domain: "Network Error", code: -1, userInfo: nil)
        
        let expectation = self.expectation(description: "Fetching products fails")
        
        viewModel.fetchProducts()
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
            XCTAssertTrue(self.viewModel.allProducts.isEmpty)
            expectation.fulfill()
        }
        
        wait(for: [expectation], timeout: 2.0)
    }
    
    func testAddProduct() {
        let product = Product(id: 1, title: "Test Product", description: "A product", price: 100, selectedQuantity: 1)
        viewModel.allProducts = [product]
        
        viewModel.addProduct(withID: 1)
        
        XCTAssertEqual(viewModel.selectedProducts.count, 1)
        XCTAssertEqual(viewModel.selectedProducts.first?.title, "Test Product")
    }
    
    func testPerformanceExample() throws {
        self.measure {
            for i in 1...1000 {
                viewModel.addProduct(product: Product(id: i, title: "Product \(i)", description: "Description for product \(i)", price: Double(i), selectedQuantity: 1))
            }
        }
    }
    
    func testRemoveProduct() {
        let product1 = Product(id: 1, title: "Test Product 1", description: "A product", price: 100, selectedQuantity: 1)
        let product2 = Product(id: 2, title: "Test Product 2", description: "Another product", price: 200, selectedQuantity: 2)
        viewModel.selectedProducts = [product1, product2]
        
        viewModel.removeProduct(withID: 1)
        
        XCTAssertEqual(viewModel.selectedProducts.count, 1)
        XCTAssertEqual(viewModel.selectedProducts.first?.id, 2, "Product with ID 2 should remain in the cart")
    }
    
    func testClearCart() {
        viewModel.selectedProducts = [
            Product(id: 1, title: "Test Product 1", description: "A product", price: 100, selectedQuantity: 1),
            Product(id: 2, title: "Test Product 2", description: "Another product", price: 200, selectedQuantity: 2)
        ]
        
        viewModel.clearCart()
        
        XCTAssertTrue(viewModel.selectedProducts.isEmpty, "Cart should be empty after clearing")
    }
    
    func testCalculateTotalPrice() {
        let product1 = Product(id: 1, title: "Test Product 1", description: "A product", price: 100, selectedQuantity: 1)
        let product2 = Product(id: 2, title: "Test Product 2", description: "Another product", price: 150, selectedQuantity: 2)
        viewModel.selectedProducts = [product1, product2]

        let totalPrice = viewModel.totalPrice

        XCTAssertEqual(totalPrice, 400, "Total price should be calculated as the sum of the prices of all products in the cart, factoring in their quantities.")
    }
}
