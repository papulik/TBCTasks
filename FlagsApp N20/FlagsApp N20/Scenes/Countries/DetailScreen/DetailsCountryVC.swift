//
//  DetailsCountryVC.swift
//  FlagsApp N20
//
//  Created by Zuka Papuashvili on 20.04.24.
//

import UIKit

class DetailsCountryVC: UIViewController {
    
    //MARK: - Properties
    let scrollView = UIScrollView()
    let detailView = DetailView()
    var viewModel: DetailsCountryViewModel?
    
    //MARK: - LifeCycles
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupScrollView()
        buttonActions()
        viewModel?.delegate = self
        if let viewModel = viewModel {
            title = viewModel.titleName
            didUpdateCountryDetails()
        }
    }
    
    //MARK: - Setup ScrollView
    private func setupScrollView() {
        view.backgroundColor = .darkMode
        title = viewModel?.titleName
        view.addSubview(scrollView)
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        
        scrollView.addSubview(detailView)
        detailView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            //scroll:
            scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -10),
            //DetailView:
            detailView.topAnchor.constraint(equalTo: scrollView.contentLayoutGuide.topAnchor, constant: 27),
            detailView.leadingAnchor.constraint(equalTo: scrollView.contentLayoutGuide.leadingAnchor),
            detailView.trailingAnchor.constraint(equalTo: scrollView.contentLayoutGuide.trailingAnchor),
            detailView.bottomAnchor.constraint(greaterThanOrEqualTo: scrollView.contentLayoutGuide.bottomAnchor),
            detailView.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
        ])
    }
    
    //MARK: - Button Actions:
    private func buttonActions() {
        let action1 = UIAction { [weak self] _ in
            if let urlString = self?.viewModel?.openStreetURL, let url = URL(string: urlString) {
                UIApplication.shared.open(url)
            }
        }
        
        detailView.linksStack.linkButton1.addAction(action1, for: .touchUpInside)
        
        let action2 = UIAction { [weak self] _ in
            if let urlString = self?.viewModel?.googleURL, let url = URL(string: urlString) {
                UIApplication.shared.open(url)
            }
        }
        
        detailView.linksStack.linkButton2.addAction(action2, for: .touchUpInside)
    }
}

extension DetailsCountryVC: DetailsCountryViewModelDelegate {
    func didUpdateCountryDetails() {
        guard let viewModel = viewModel else { return }
        
        if let urlString = viewModel.imageUrl, let url = URL(string: urlString) {
            detailView.flagImage.loadImage(from: url)
        }
        detailView.aboutFlag.text = "About the Flag:"
        detailView.aboutFlagBody.text = viewModel.aboutBody
        detailView.customStack.nativeName.text = viewModel.countryName
        detailView.customStack.spellingName.text = viewModel.spellingName
        detailView.customStack.capitalName.text = viewModel.capitalName
        detailView.customStack.currencyName.text = viewModel.currencyName
        detailView.customStack.regionName.text = viewModel.regionName
        detailView.customStack.neighborsName.text = viewModel.neighborsName
    }
    
    func didFailWithError(_ error: String) {
        print("Error: \(error)")
    }
    
}
