//
//  PlayerVC.swift
//  Animations Player - N25
//
//  Created by Zuka Papuashvili on 10.05.24.
//

import UIKit

class PlayerVC: UIViewController {
    
    //MARK: - Properties
    private let mainStack = MainStackView()
    private let navView = NavView()
    private let loadingCircleView = LoadingCircleView()
    private var progressTimer: Timer?
    private var currentProgress: Float = 0.0
    private var viewModel: PlayerViewModel!
    
    //MARK: - Init
    init(viewModel: PlayerViewModel) {
        super.init(nibName: nil, bundle: nil)
        self.viewModel = viewModel
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - LifeCycles
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        mainStack.playerButtonsStack.onPlayPauseToggled = handlePlayPauseToggled
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        didLoadViewModels()
        bindViewModel()
    }
    
    private func bindViewModel() {
        viewModel.onUpdate = { [weak self] in
            self?.updateUI()
        }
    }
    
    private func updateUI() {
        if viewModel.isPlaying {
            animateImageView(isPlaying: true)
            showLoadingAnimation()
        } else {
            animateImageView(isPlaying: false)
            hideLoadingAnimation()
        }
    }
    
    private func didLoadViewModels() {
        mainStack.songStack.viewModel = viewModel
        mainStack.playerButtonsStack.viewModel = viewModel
    }
    
    //MARK: - Play & Pause Handler With Loader
    private func handlePlayPauseToggled(isPlaying: Bool) {
        if viewModel.isPlaying {
            animateImageView(isPlaying: true)
            showLoadingAnimation()
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 5) { [weak self] in
                guard let self = self else { return }
                self.hideLoadingAnimation()
                self.startProgressTimer()
            }
        } else {
            stopProgressTimer()
            animateImageView(isPlaying: false)
            hideLoadingAnimation()
        }
    }
    
    //MARK: - Start Loader
    private func showLoadingAnimation() {
        loadingCircleView.isHidden = false
        loadingCircleView.startAnimating()
    }
    
    //MARK: - Dismiss Loader
    private func hideLoadingAnimation() {
        loadingCircleView.isHidden = true
        loadingCircleView.stopAnimating()
    }

    //MARK: - Start Progress
    private func startProgressTimer() {
        progressTimer?.invalidate()
        progressTimer = Timer.scheduledTimer(withTimeInterval: 0.1, repeats: true) { [weak self] _ in
            guard let self = self else { return }
            self.updateProgressBar()
        }
    }
    
    //MARK: - Pause Progress
    private func stopProgressTimer() {
        progressTimer?.invalidate()
        progressTimer = nil
    }
    
    //MARK: - Update Progress
    private func updateProgressBar() {
        if currentProgress >= 1.0 {
            currentProgress = 0.0
            mainStack.progressBar.setProgress(currentProgress, animated: false)
            stopProgressTimer()
            mainStack.playerButtonsStack.resetPlayback()
        } else {
            currentProgress += 0.01
            mainStack.progressBar.setProgress(currentProgress, animated: true)
            mainStack.timerStack.timeLeftLabel.text = formatTime(for: currentProgress)
        }
    }
    
    //MARK: - Time Formatter
    private func formatTime(for progress: Float) -> String {
        let totalSeconds = 225
        let currentSeconds = Int(Float(totalSeconds) * progress)
        return "\(currentSeconds / 60):\(String(format: "%02d", currentSeconds % 60))"
    }

    //MARK: - ImageView Animation
    private func animateImageView(isPlaying: Bool) {
        UIView.animate(withDuration: 0.3) {
            self.mainStack.imageView.transform = isPlaying ? CGAffineTransform(scaleX: 0.6, y: 0.6) : CGAffineTransform.identity
        }
    }
    
    //MARK: - Setup UI & Loader
    private func setupUI() {
        view.backgroundColor = .backGroundcolor
        view.addSubview(mainStack)
        view.addSubview(navView)
        view.addSubview(loadingCircleView)
        
        loadingCircleView.isHidden = true
        loadingCircleView.center = view.center
        loadingCircleView.bounds = CGRect(x: 0, y: 0, width: 100, height: 100)
        
        setupConstraints()
    }
    
    //MARK: - Constraints
    private func setupConstraints() {
        mainStack.translatesAutoresizingMaskIntoConstraints = false
        navView.translatesAutoresizingMaskIntoConstraints = false
        loadingCircleView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            mainStack.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 0),
            mainStack.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 36),
            mainStack.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -36),
            mainStack.bottomAnchor.constraint(equalTo: navView.topAnchor, constant: -50),
            
            navView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            navView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            navView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            navView.heightAnchor.constraint(equalToConstant: 100),
            
            loadingCircleView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            loadingCircleView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            loadingCircleView.widthAnchor.constraint(equalToConstant: 50),
            loadingCircleView.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
}
