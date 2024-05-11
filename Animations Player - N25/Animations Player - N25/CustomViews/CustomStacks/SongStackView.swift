//
//  SongStackView.swift
//  Animations Player - N25
//
//  Created by Zuka Papuashvili on 10.05.24.
//

import UIKit

final class SongStackView: UIStackView {
    
    //MARK: - Properties
    let songLabel = UILabel()
    let artistLabel = UILabel()
    var viewModel: PlayerViewModel?
    
    //MARK: - Init
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupStackView()
        setupLabels()
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Setup Stack
    private func setupStackView() {
        axis = .vertical
        distribution = .fill
        alignment = .fill
        spacing = 7
    }
    
    //MARK: - Setup Timer Labels
    private func setupLabels() {
        songLabel.text = viewModel?.songName
        songLabel.font = UIFont.systemFont(ofSize: 17, weight: .semibold)
        songLabel.textAlignment = .center
        songLabel.textColor = .white
        
        artistLabel.text = viewModel?.artistName
        artistLabel.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        artistLabel.textAlignment = .center
        artistLabel.textColor = .gray
        
        addArrangedSubview(songLabel)
        addArrangedSubview(artistLabel)
    }
}
