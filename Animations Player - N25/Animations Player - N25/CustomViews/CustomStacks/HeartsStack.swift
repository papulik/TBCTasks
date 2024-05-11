//
//  HeartsStack.swift
//  Animations Player - N25
//
//  Created by Zuka Papuashvili on 10.05.24.
//

import UIKit

final class HeartsStack: UIStackView {
    
    //MARK: Poperties
    let button1 = UIButton()
    let button2 = UIButton()
    let button3 = UIButton()
    let button4 = UIButton()
    let button5 = UIButton()
    private var buttons: [UIButton] {
        return [button1, button2, button3, button4, button5]
    }
    
    //MARK: - Init
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupStack()
        setupHearts()
        addGesture()
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - SetupStack
    private func setupStack() {
        axis = .horizontal
        distribution = .fillEqually
        alignment = .fill
        spacing = 14
    }
    
    //MARK: - Setup Heart Buttons
    private func setupHearts() {
        for button in buttons {
            addArrangedSubview(button)
            button.setImage(UIImage(systemName: "heart"), for: .normal)
            button.tintColor = .lightGray
        }
    }
    
    //MARK: - Gesture On Stack
    private func addGesture() {
        let panGesture = UIPanGestureRecognizer(target: self, action: #selector(handlePanGesture(_:)))
        addGestureRecognizer(panGesture)
    }
    
    //MARK: - Pen Gesture
    @objc private func handlePanGesture(_ gesture: UIPanGestureRecognizer) {
        let location = gesture.location(in: self)
        updateHearts(for: location)
        if gesture.state == .ended {
            resetHeartsAfterDelay()
        }
    }
    
    //MARK: - Update Heart State
    private func updateHearts(for location: CGPoint) {
        for (index, button) in buttons.enumerated() {
            if button.frame.contains(location) {
                fillHearts(upTo: index)
                break
            }
        }
    }
    
    //MARK: - Heart Filler
    private func fillHearts(upTo index: Int) {
        for (i, button) in buttons.enumerated() {
            if i <= index {
                button.setImage(UIImage(systemName: "heart.fill"), for: .normal)
                button.tintColor = .red
            } else {
                button.setImage(UIImage(systemName: "heart"), for: .normal)
                button.tintColor = .lightGray
            }
        }
    }
    
    //MARK: - Resseting Hearts State
    private func resetHeartsAfterDelay() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
            for button in self.buttons {
                button.setImage(UIImage(systemName: "heart"), for: .normal)
                button.tintColor = .lightGray
            }
        }
    }
}
