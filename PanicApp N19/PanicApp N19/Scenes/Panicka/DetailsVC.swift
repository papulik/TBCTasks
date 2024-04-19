//
//  DetailsVC.swift
//  PanicApp N19
//
//  Created by Zuka Papuashvili on 19.04.24.
//

import UIKit

class DetailsVC: UIViewController {
    
    //MARK: UI Properties
    let detailsImage = UIImageView()
    let timeLabel = UILabel()
    let textView = UITextView()
    
    //MARK: - Other Properties:
    var imageUrl: URL?
    var timeText: String?
    var bodyText: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        loadContent()
    }
    
    //MARK: - Details Setup
    private func setupUI() {
        view.backgroundColor = .white
        //subs:
        view.addSubview(detailsImage)
        view.addSubview(timeLabel)
        view.addSubview(textView)
        //resizing:
        detailsImage.translatesAutoresizingMaskIntoConstraints = false
        timeLabel.translatesAutoresizingMaskIntoConstraints = false
        textView.translatesAutoresizingMaskIntoConstraints = false
        //title:
        title = "Details"
        //image:
        detailsImage.clipsToBounds = true
        detailsImage.layer.cornerRadius = 15
        detailsImage.contentMode = .scaleAspectFill
        //text:
        textView.textAlignment = .natural
        textView.font = .systemFont(ofSize: 16, weight: .semibold)
        //time:
        timeLabel.font = .systemFont(ofSize: 16, weight: .bold)
        //constraints:
        constraintsUI()
    }
    
    //MARK: Details Constraints:
    private func constraintsUI(){
        NSLayoutConstraint.activate([
            //image:
            detailsImage.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10),
            detailsImage.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 24),
            detailsImage.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -24),
            detailsImage.heightAnchor.constraint(equalToConstant: 190),
            //time:
            timeLabel.topAnchor.constraint(equalTo: detailsImage.bottomAnchor, constant: 13),
            timeLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -24),
            timeLabel.heightAnchor.constraint(equalToConstant: 50),
            //body:
            textView.topAnchor.constraint(equalTo: timeLabel.bottomAnchor, constant: 26),
            textView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 36),
            textView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -36),
            textView.heightAnchor.constraint(equalToConstant: 280)
        ])
    }
    
    //MARK: Loading Content:
    private func loadContent() {
        if let url = imageUrl {
            detailsImage.loadImage(from: url)
        }
        timeLabel.text = timeText
        textView.text = bodyText
    }
}
