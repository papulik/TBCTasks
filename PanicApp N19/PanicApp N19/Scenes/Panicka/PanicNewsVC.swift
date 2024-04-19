//
//  PanicNewsVC.swift
//  PanicApp N19
//
//  Created by Zuka Papuashvili on 18.04.24.
//

import UIKit

class PanicNewsVC: UIViewController {
    
    //MARK: - Properties
    let tableView = UITableView()
    var news = [NewsItem]()
    
    //MARK: - LifeCyles
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        fetchNewsData()
    }
    
    //MARK: - PanicNewsVC UI Setup
    func setupUI() {
        title = "Panic News"
        //subs:
        view.addSubview(tableView)
        //resizing:
        tableView.translatesAutoresizingMaskIntoConstraints = false
        //tableview:
        tableView.register(PanicTableViewCell.self, forCellReuseIdentifier: "cell")
        tableView.delegate = self
        tableView.dataSource = self
        //constraints:
        tableViewConstraints()
    }
    
    //MARK: - Constraints
    func tableViewConstraints() {
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
    
    //MARK: - Fetching Data:
    func fetchNewsData() {
        Networking.shared.fetchData { [weak self] result in
            DispatchQueue.main.async {
                switch result {
                case .success(let infoData):
                    self?.news = infoData.list  // Assuming `list` is the array of news items
                    self?.tableView.reloadData()
                case .failure(let error):
                    print("Error: \(error.localizedDescription)")
                    // Handle error e.g., show an alert
                }
            }
        }
    }
    
}

//MARK: - TableView Delegates
extension PanicNewsVC: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return news.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! PanicTableViewCell
        
        let item = news[indexPath.section]
        cell.infoLabel.text = item.title
        cell.timeLabel.text = item.time
        cell.backgroundImage.loadImage(from: item.photoUrl)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 108
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 12
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let view = UIView()
        view.backgroundColor = UIColor.clear
        return view
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let item = news[indexPath.section]
        
        let detailsVC = DetailsVC()
        detailsVC.imageUrl = item.photoUrl
        detailsVC.timeText = item.time
        detailsVC.bodyText = item.title
        navigationController?.pushViewController(detailsVC, animated: true)
    }
    
}

//MARK: - LoadImages
extension UIImageView {
    func loadImage(from url: URL) {
        URLSession.shared.dataTask(with: url) { [weak self] data, response, error in
            guard let data = data, let image = UIImage(data: data), error == nil else {
                return
            }
            DispatchQueue.main.async {
                self?.image = image
            }
        }.resume()
    }
}

//MARK: - Preview

#Preview {
    PanicNewsVC()
}
