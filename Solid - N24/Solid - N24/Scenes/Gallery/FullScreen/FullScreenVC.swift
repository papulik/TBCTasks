//
//  FullScreenVC.swift
//  Solid - N24
//
//  Created by Zuka Papuashvili on 08.05.24.

import UIKit

final class FullScreenVC: UIViewController {
    
    //MARK: - Diffable Datasource sections
    private enum Section {
        case main
    }
    
    //MARK: - Properties
    var collectionView: UICollectionView!
    private var dataSource: UICollectionViewDiffableDataSource<Section, Item>!
    private var viewModel: FullScreenViewModel
    
    //MARK: - Init
    init(viewModel: FullScreenViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Lifecycles
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black
        setupCollectionView()
        configureDataSource()
        applyInitialSnapshot()
    }
    
    //MARK: - Setup CollectionView
    private func setupCollectionView() {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.itemSize = view.bounds.size
        layout.minimumLineSpacing = 0
        layout.minimumInteritemSpacing = 0
        
        collectionView = UICollectionView(frame: view.bounds, collectionViewLayout: layout)
        collectionView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        collectionView.backgroundColor = .black
        collectionView.isPagingEnabled = true
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.register(FullScreenCell.self, forCellWithReuseIdentifier: FullScreenCell.reuseIdentifier)
        
        view.addSubview(collectionView)
    }
    
    //MARK: - DataSource
    private func configureDataSource() {
        dataSource = UICollectionViewDiffableDataSource<Section, Item>(collectionView: collectionView) { [weak self] (collectionView, indexPath, item) -> UICollectionViewCell? in
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: FullScreenCell.reuseIdentifier, for: indexPath) as? FullScreenCell,
                  let urlString = self?.viewModel.item(at: indexPath)?.photo.urls.regular else {
                fatalError("Cannot create new cell")
            }
            cell.configure(with: urlString)
            return cell
        }
    }
    
    //MARK: - Apply Snapshot
    private func applyInitialSnapshot() {
        var snapshot = NSDiffableDataSourceSnapshot<Section, Item>()
        snapshot.appendSections([.main])
        snapshot.appendItems(viewModel.items)
        dataSource.apply(snapshot, animatingDifferences: true)
        
        if viewModel.initialIndex < viewModel.items.count {
            collectionView.scrollToItem(at: IndexPath(row: viewModel.initialIndex, section: 0), at: .centeredHorizontally, animated: true)
        }
    }
}
