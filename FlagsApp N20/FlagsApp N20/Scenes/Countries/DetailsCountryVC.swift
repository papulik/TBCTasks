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
    //other Properties:
    var countryDetails = CountryDetails()
    
    //MARK: - LifeCycles
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupScrollView()
        loadContent()
        buttonActions()
    }
    
    //MARK: - Setup ScrollView
    private func setupScrollView() {
        title = countryDetails.titleName
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
    
    //MARK: Loading Content:
    private func loadContent() {
        if let urlString = countryDetails.imageUrl, let url = URL(string: urlString) {
            detailView.flagImage.loadImage(from: url)
        }
        detailView.aboutFlag.text = "About the flag:"
        detailView.aboutFlagBody.text = countryDetails.aboutBody
        detailView.customStack.nativeName.text = countryDetails.countryName
        detailView.customStack.spellingName.text = countryDetails.spellingName
        detailView.customStack.capitalName.text = countryDetails.capitalName
        detailView.customStack.currencyName.text = countryDetails.currencyName
        detailView.customStack.regionName.text = countryDetails.regionName
        detailView.customStack.neighborsName.text = countryDetails.neighborsName
    }
    
    //MARK: - Button Actions:
    private func buttonActions() {
        let action1 = UIAction { [weak self] _ in
            if let urlString = self?.countryDetails.openStreetURL, let url = URL(string: urlString) {
                UIApplication.shared.open(url)
            }
        }
        
        detailView.linksStack.linkButton1.addAction(action1, for: .touchUpInside)
        
        let action2 = UIAction { [weak self] _ in
            if let urlString = self?.countryDetails.googleURL, let url = URL(string: urlString) {
                UIApplication.shared.open(url)
            }
        }
        
        detailView.linksStack.linkButton2.addAction(action2, for: .touchUpInside)
    }
}
