//
//  CustomVerticalStack.swift
//  FlagsApp N20
//
//  Created by Zuka Papuashvili on 21.04.24.
//

import UIKit

class CustomVerticalStack: UIStackView {
    
    //MARK: - Stack UI Properties
    // Inner HorizontalStacks:
    let horizontalStack1 = UIStackView()
    let horizontalStack2 = UIStackView()
    let horizontalStack3 = UIStackView()
    let horizontalStack4 = UIStackView()
    let horizontalStack5 = UIStackView()
    let horizontalStack6 = UIStackView()
    // Left Side of the stack
    let native = UILabel()
    let spelling = UILabel()
    let capital = UILabel()
    let currency = UILabel()
    let region = UILabel()
    let neighbors = UILabel()
    // Right Side of the stack
    let nativeName = UILabel()
    let spellingName = UILabel()
    let capitalName = UILabel()
    let currencyName = UILabel()
    let regionName = UILabel()
    let neighborsName = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        axis = .vertical
        distribution = .equalSpacing
        alignment = .fill
        spacing = 15
        setupStack()
        setupHorizontals()
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Horizontal Stacks
    private func setupHorizontals() {
        let stackViews = [horizontalStack1, horizontalStack2, horizontalStack3, horizontalStack4, horizontalStack5, horizontalStack6]
        for stack in stackViews {
            stack.axis = .horizontal
            stack.alignment = .fill
            stack.distribution = .equalSpacing
        }
        //stack1
        horizontalStack1.addArrangedSubview(native)
        horizontalStack1.addArrangedSubview(nativeName)
        //stack2
        horizontalStack2.addArrangedSubview(spelling)
        horizontalStack2.addArrangedSubview(spellingName)
        //stack3
        horizontalStack3.addArrangedSubview(capital)
        horizontalStack3.addArrangedSubview(capitalName)
        //stack4
        horizontalStack4.addArrangedSubview(currency)
        horizontalStack4.addArrangedSubview(currencyName)
        //stack5
        horizontalStack5.addArrangedSubview(region)
        horizontalStack5.addArrangedSubview(regionName)
        //stack5
        horizontalStack6.addArrangedSubview(neighbors)
        horizontalStack6.addArrangedSubview(neighborsName)
    }

    //MARK: - Setucp Main Stack
    private func setupStack() {
        let horizontalStacks = [horizontalStack1, horizontalStack2, horizontalStack3, horizontalStack4, horizontalStack5, horizontalStack6]
        for stack in horizontalStacks {
            addArrangedSubview(stack)
        }
        
        setupLabels()
    }

    //MARK: - Setup Labels
    private func setupLabels() {
        let labels = [native, spelling, capital, currency, neighbors, nativeName, spellingName, capitalName, currencyName, neighborsName, region, regionName]
        for label in labels {
            label.font = UIFont.systemFont(ofSize: 14)
            label.textColor = .black
        }
        
    }
}
