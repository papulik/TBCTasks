//
//  ViewController.swift
//  Assignment N12
//
//  Created by Zuka Papuashvili on 03.04.24.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var statusLabel: UILabel!
    @IBOutlet weak var topTextField: UITextField!
    @IBOutlet weak var bottomTextField: UITextField!
    @IBOutlet weak var sumLabel: UILabel!
    @IBOutlet weak var switcher: UISwitch!
    @IBOutlet weak var button: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        button.layer.cornerRadius = 18
        switcher.isOn = false
        statusLabel.text = "უმცირესი საერთო ჯერადი"
        
    }
    
    @IBAction func statusChanger(_ sender: UISwitch) {
        if sender.isOn {
            statusLabel.text = "უდიდესი საერთო გამყოფი"
            button.backgroundColor = .systemOrange
        } else {
            statusLabel.text = "უმცირესი საერთო ჯერადი"
            button.backgroundColor = .darkAndLightColors //custom darkModeLightMode color ღილაკისთვის.
        }
    }
    
    @IBAction func sumButton(_ sender: UIButton) {
        guard let number1 = Int(topTextField.text ?? ""), let number2 = Int(bottomTextField.text ?? "") else {
            //ვიზუალური იდენტიფიკატორი.
            highlightErrorInTextFields()
            return
        }
        
        // უსგ ან უსჯ გამოთვლა switcher - ის მიხედვით.
        if switcher.isOn {
            let gcd = greatestCommonDivisor(number1, number2)
            sumLabel.text = "პასუხი: \(gcd)"
        } else {
            let lcm = leastCommonMultiple(number1, number2)
            sumLabel.text = "პასუხი: \(lcm)"
        }
    }
    
    // Function to calculate: უდიდესი საერთო გამყოფი (უსგ)
    func greatestCommonDivisor(_ a: Int, _ b: Int) -> Int {
        return b == 0 ? a : greatestCommonDivisor(b, a % b)
    }
    
    // Function to calculate: უმცირესი საერთო ჯერადი (უსჯ)
    func leastCommonMultiple(_ a: Int, _ b: Int) -> Int {
        return (a * b) / greatestCommonDivisor(a, b)
    }
    
    // ვიზუალური იდენთიფიკატორი textField-ზე.
    func highlightErrorInTextFields() {
        if Int(topTextField.text ?? "") == nil {
            topTextField.backgroundColor = .red
        }
        if Int(bottomTextField.text ?? "") == nil {
            bottomTextField.backgroundColor = .red
        }
        
        // Reset text fields' background color after a delay
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.2) { [weak self] in
            self?.topTextField.backgroundColor = .darkAndLightColors //custom darkModeLightMode color ღილაკისთვის.
            self?.bottomTextField.backgroundColor = .darkAndLightColors //custom darkModeLightMode color ღილაკისთვის.
        }
    }
    
}

