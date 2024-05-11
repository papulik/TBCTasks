//
//  TimerStackView.swift
//  Animations Player - N25
//
//  Created by Zuka Papuashvili on 10.05.24.
//

import UIKit

final class TimerStackView: UIStackView {
    
    //MARK: - Properties
    let timeLeftLabel = UILabel()
    let fullTimeLabel = UILabel()
    
    //MARK: - Init
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureStackView()
        setupLabels()
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Setup Stack
    private func configureStackView() {
        axis = .horizontal
        distribution = .equalCentering
        alignment = .center
        spacing = 230

        addArrangedSubview(timeLeftLabel)
        addArrangedSubview(fullTimeLabel)
    }
    
    //MARK: - Setup Labels
    private func setupLabels() {
        timeLeftLabel.text = "0:00"
        timeLeftLabel.font = .systemFont(ofSize: 12)
        timeLeftLabel.textAlignment = .left
        timeLeftLabel.textColor = .white
        
        fullTimeLabel.text = "3:45"
        fullTimeLabel.font = .systemFont(ofSize: 12)
        fullTimeLabel.textAlignment = .right
        fullTimeLabel.textColor = .white
    }
}
