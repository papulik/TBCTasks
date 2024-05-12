//
//  ViewController.swift
//  UnitTestingAssignment
//
//  Created by Chuck Norris on 11.05.1992.
//

import UIKit

final class ViewController: UIViewController {
    
    private var cartViewModel: CartViewModel
    
    init(cartViewModel: CartViewModel) {
        self.cartViewModel = cartViewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        cartViewModel.viewDidLoad()
    }
}
