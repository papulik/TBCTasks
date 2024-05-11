//
//  PlayerButtonsStack.swift
//  Animations Player - N25
//
//  Created by Zuka Papuashvili on 10.05.24.
//

import UIKit

final class PlayerButtonsStack: UIStackView {
    
    //MARK: - Properties
    let shuffle = UIButton()
    let backward = UIButton()
    let startStop = UIButton()
    let forward = UIButton()
    let repete = UIButton()
    
    var onPlayPauseToggled: ((Bool) -> Void)?
    
    var viewModel: PlayerViewModel? {
        didSet {
            bindViewModel()
        }
    }
    
    //MARK: - Init
    override init(frame: CGRect) {
        super.init(frame: frame)
        axis = .horizontal
        distribution = .fill
        alignment = .fill
        spacing = 20
        setubButtons()
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func bindViewModel() {
        updatePlayPauseButton()
            viewModel?.onUpdate = { [weak self] in
                print("ViewModel onUpdate triggered")
                self?.updatePlayPauseButton()
            }
    }
    
    private func updatePlayPauseButton() {
        let isPlaying = self.viewModel?.isPlaying ?? false
        let imageName = isPlaying ? UIImage(named: "circle") : UIImage(named: "play")
        self.startStop.setImage(imageName, for: .normal)
        
    }
    
    //MARK: - Setup Buttons
    private func setubButtons() {
        let allButtons = [shuffle, backward, startStop, forward, repete]
        allButtons.forEach { button in
            addArrangedSubview(button)
            button.imageView?.contentMode = .scaleToFill
            button.imageView?.translatesAutoresizingMaskIntoConstraints = false
            button.tintColor = .white
        }
        
        shuffle.setImage(UIImage(systemName: "shuffle"), for: .normal)
        shuffle.imageView?.contentMode = .scaleAspectFit
        
        backward.setImage(UIImage(systemName: "backward"), for: .normal)
        backward.imageView?.contentMode = .scaleAspectFit
        
        startStop.setImage(UIImage(named: "play"), for: .normal)
        startStop.tintColor = .blue
        startStop.imageView?.contentMode = .scaleToFill
        startStop.addTarget(self, action: #selector(togglePlayPause), for: .touchUpInside)
        
        forward.setImage(UIImage(systemName: "forward"), for: .normal)
        forward.imageView?.contentMode = .scaleAspectFit
        
        repete.setImage(UIImage(systemName: "repeat"), for: .normal)
        repete.imageView?.contentMode = .scaleAspectFit
        
        NSLayoutConstraint.activate([
            startStop.heightAnchor.constraint(equalToConstant: 76),
            startStop.widthAnchor.constraint(equalToConstant: 75)
        ])
    }
    
    //MARK: - Play & Pause Action
    @objc private func togglePlayPause() {
        viewModel?.togglePlayPause()
        let isPlaying = viewModel?.isPlaying ?? false
        let newImage = isPlaying ? UIImage(named: "circle") : UIImage(named: "play")
        startStop.setImage(newImage, for: .normal)
        onPlayPauseToggled?(isPlaying)
    }
    
    //MARK: - Reset On Full Progress
    func resetPlayback() {
        let newImage = UIImage(named: "play")
        startStop.setImage(newImage, for: .normal)
        viewModel?.isPlaying = false
    }
}
