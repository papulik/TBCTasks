//
//  ViewController.swift
//  CoffeN13
//
//  Created by Zuka Papuashvili on 05.04.24.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var largeTextLabel: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var likeCountLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var purchase: UIButton!
    @IBOutlet weak var whiteView: UIView!
    @IBOutlet weak var productLabel: UILabel!
    @IBOutlet weak var recipeLabel: UILabel!
    @IBOutlet weak var rateingLabel: UILabel!
    //button outlets:
    @IBOutlet weak var buttonSmall: UIButton!
    @IBOutlet weak var buttonMedium: UIButton!
    @IBOutlet weak var buttonBig: UIButton!
    //other variables & Coffe instances:
    var lastPressedButtonTag = 0
    var latte = Coffe(productName: "ლატე", price: 2.40, recipe: "რძე", description: "ლატე არის ყავა რძით, რომელიც კარგია მათთვის ვისაც გული უჩქარდება ყავაზე.")
    var capuccino = Coffe(productName: "კაპუჩინო", price: 4.60, recipe: "კარამელი", description: "საშუალო სიძლიერის ყავა, რომელიც ზოგს ანერვოზებს მაგრამ მაინც კაია.")
    var espresso = Coffe(productName: "ესპრესო", price: 3.45, recipe: "", description: "ექსტრა კოფეინიიი... აეეე! კარგია მაშინ, როცა დავალებები გასაკეთებელია დრო კი ცოტაა. (მიიღეთ პასუხისმგებლობით!)")
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        configureUI()
        // test Struct with this func: --->
        coffeTest(coffe: latte) // ჩასვით ზემოთ მოცემული ინსტანსები ამ ფუნქციაში 🤓.
        setInitialPrice()
    }
    
    //MARK: - Button Actions
    
    @IBAction func heartButton(_ sender: UIButton) {
        sender.isSelected = !sender.isSelected
        
        // ხმის მიმატება label-ში
        let trimmedText = likeCountLabel.text?.trimmingCharacters(in: CharacterSet(charactersIn: "()"))
        if let initialLikes = Int(trimmedText ?? "0") {
            let like = 1
            
            if sender.isSelected {
                sender.setImage(UIImage(systemName: "heart.fill"), for: .normal)
                sender.tintColor = .red
                likeCountLabel.text = "(\(initialLikes + like))"
            } else {
                sender.setImage(UIImage(systemName: "heart"), for: .normal)
                sender.tintColor = .black
                likeCountLabel.text = "(\(initialLikes - like))"
            }
        } else {
            print("Error: Like count label does not contain a valid number.")
        }
        
        // რეიტინგის განახლება.
        if let initialRating = Double(rateingLabel.text ?? "0") {
            let ratingChange = sender.isSelected ? 0.1 : -0.1
            let newRating = min(max(initialRating + ratingChange, 0), 5.0)
            rateingLabel.text = String(format: "%.1f", newRating)
        } else {
            print("Error: Rating label does not contain a valid number.")
        }
    }
    
    @IBAction func purchaseButton(_ sender: UIButton) {
        let errorVC = UIAlertController(title: "✅", message: "გილოცავთ, ტრანზაქცია წარმატებით შესრულდა!", preferredStyle: .alert)
        let action = UIAlertAction(title: "Ok", style: .cancel)
        errorVC.addAction(action)
        
        present(errorVC, animated: true)
    }
    
    @IBAction func sizeButton(_ sender: UIButton) {
        
        if lastPressedButtonTag != 0, let lastButton = sender.superview?.viewWithTag(lastPressedButtonTag) as? UIButton {
            lastButton.backgroundColor = .clear
            lastButton.layer.borderColor = UIColor.lightGray.cgColor
        }
        
        sender.backgroundColor = .systemGreen
        sender.layer.borderColor = UIColor.systemGreen.cgColor
        
        var price = initialPrice
        
        switch sender.tag {
        case 1:
            price *= 2
        case 2:
            price *= 3
        default:
            price *= 4
        }
        
        priceLabel.text = String(format: "%.2f", price)
        
        lastPressedButtonTag = sender.tag
        
    }
    
    //MARK: - Other Functions:
    
    var initialPrice: Double = 0.0
    
    func setInitialPrice() {
        if let price = Double(priceLabel.text ?? "") {
            initialPrice = price
        } else {
            print("Invalid initial price")
        }
    }
    
    //Function Too test Struct and initialize app from it.
    func coffeTest(coffe: Coffe) {
        productLabel.text = coffe.productName
        recipeLabel.text = coffe.recipe
        largeTextLabel.text = coffe.description
        priceLabel.text = String(coffe.price)
    }
    
    
    //MARK: - UI Configuration
    
    func configureUI() {
        imageView.layer.cornerRadius = 9
        imageView.clipsToBounds = true
        //პაწა ღილაკი
        buttonSmall.layer.borderWidth = 2.0
        buttonSmall.layer.cornerRadius = 10
        buttonSmall.layer.borderColor = UIColor.lightGray.cgColor
        //საშუალო ღილაკი
        buttonMedium.layer.borderWidth = 2.0
        buttonMedium.layer.cornerRadius = 10
        buttonMedium.layer.borderColor = UIColor.lightGray.cgColor
        //დიდი ღილაკი
        buttonBig.layer.borderWidth = 2.0
        buttonBig.layer.cornerRadius = 10
        buttonBig.layer.borderColor = UIColor.lightGray.cgColor
        //ყიდვის ღილაკი
        purchase.layer.cornerRadius = 10
        //White View
        whiteView.layer.cornerRadius = 25
    }
    
}
