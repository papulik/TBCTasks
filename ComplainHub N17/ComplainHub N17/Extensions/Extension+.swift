//
//  Extension+.swift
//  ComplainHub N17
//
//  Created by Zuka Papuashvili on 14.04.24.
//

import UIKit

//MARK: - Collection Delegates:

extension MainVC: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        someData.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! CollectionViewCell
        cell.backgroundColor = .cellBackground
        cell.layer.cornerRadius = 15
        let imageName = someData[indexPath.row].imageName
        let topText = someData[indexPath.row].topText
        let details = someData[indexPath.row].detailText
        cell.configureCell(imageName: imageName, topText: topText, details: details)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        someData.remove(at: indexPath.row)
        collectionView.performBatchUpdates({
            collectionView.deleteItems(at: [indexPath])
        }) { [weak self] finished in
            if finished {
                let alertVC = UIAlertController(title: "Successfully Deleted", message: "გილოცავთ, ბარათი წარმათებით წაიშალა ✅", preferredStyle: .alert)
                let action = UIAlertAction(title: "Ok", style: .cancel)
                alertVC.addAction(action)
                self?.present(alertVC, animated: true)
            }
        }
    }
    
}

//MARK: - DataModel Delegate:

extension MainVC: DataModelDelegate {
    func sendData(data: DataModel) {
        someData.append(data)
        collectionView.reloadData()
    }
}
