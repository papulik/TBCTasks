//
//  MainStackView.swift
//  Animations Player - N25
//
//  Created by Zuka Papuashvili on 10.05.24.
//

import UIKit

final class MainStackView: UIStackView {
    
    //MARK: - Properties
    let heartsStack = HeartsStack()
    let imageView = UIImageView()
    let songStack = SongStackView()
    let progressBar = UIProgressView(progressViewStyle: .default)
    let timerStack = TimerStackView()
    let playerButtonsStack = PlayerButtonsStack()
    
    //MARK: - Init
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureStackView()
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Setup Main Stack
    private func configureStackView() {
        axis = .vertical
        distribution = .equalCentering
        alignment = .center
        spacing = 34
        //Subs:
        addArrangedSubview(heartsStack)
        addArrangedSubview(imageView)
        addArrangedSubview(songStack)
        addArrangedSubview(progressBar)
        addArrangedSubview(timerStack)
        addArrangedSubview(playerButtonsStack)
        //heartsStack:
        heartsStack.translatesAutoresizingMaskIntoConstraints = false
        heartsStack.heightAnchor.constraint(equalToConstant: 50).isActive = true
        //imageView:
        imageView.image = UIImage(named: "Taylor")
        imageView.layer.cornerRadius = 20
        imageView.clipsToBounds = true
        imageView.contentMode = .scaleAspectFit
        //songStack:
        songStack.translatesAutoresizingMaskIntoConstraints = false
        //progressBar:
        progressBar.translatesAutoresizingMaskIntoConstraints = false
        progressBar.setProgress(0, animated: true)
        progressBar.tintColor = UIColor.systemBlue
        progressBar.trackTintColor = UIColor.lightGray
        progressBar.widthAnchor.constraint(equalTo: self.widthAnchor).isActive = true
        //timers:
        timerStack.translatesAutoresizingMaskIntoConstraints = false
        //Player Buttons:
        playerButtonsStack.translatesAutoresizingMaskIntoConstraints = false
    }
}
