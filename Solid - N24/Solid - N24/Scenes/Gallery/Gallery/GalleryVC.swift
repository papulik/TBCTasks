//
//  GalleryVC.swift
//  Solid - N24
//
//  Created by Zuka Papuashvili on 07.05.24.
//

import UIKit

final class GalleryVC: UIViewController {
    
    //MARK: - DiffableDataSource Sections
    private enum Section {
        case main
    }
    
    //MARK: - Properties
    private var collectionView: UICollectionView!
    private var dataSource: UICollectionViewDiffableDataSource<Section, Item>!
    private var viewModel: GalleryViewModel
    
    //MARK: - Init
    init(viewModel: GalleryViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Lifecycles
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        configureNavigationBar()
        configureCollectionView()
        configureDataSource()
        setupBindings()
        viewModel.loadPhotos()
    }
    
    //MARK: - NavBar Label
    private func configureNavigationBar() {
        let titleLabel = UILabel()
        titleLabel.text = "გალერეა"
        titleLabel.textColor = .systemBlue
        titleLabel.font = .monospacedDigitSystemFont(ofSize: 36, weight: .semibold)
        titleLabel.textAlignment = .center
        
        navigationItem.titleView = titleLabel
        titleLabel.sizeToFit()
    }
    
    //MARK: - CollectionView Configuration
    private func configureCollectionView() {
        let layout = UICollectionViewFlowLayout()
        let spacing: CGFloat = 3
        let totalSpacing = spacing * 2
        let itemWidth = (view.bounds.width - totalSpacing) / 3
        layout.itemSize = CGSize(width: itemWidth, height: itemWidth)
        layout.minimumInteritemSpacing = spacing
        layout.minimumLineSpacing = spacing
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = .white
        collectionView.register(CollectionViewCell.self, forCellWithReuseIdentifier: CollectionViewCell.reuseIdentifier)
        collectionView.delegate = self
        view.addSubview(collectionView)
        collectionConstraints()
    }
    
    //MARK: - Constraints
    private func collectionConstraints() {
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10),
            collectionView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
    
    //MARK: - DataSource
    private func configureDataSource() {
        dataSource = UICollectionViewDiffableDataSource<Section, Item>(collectionView: collectionView) { (collectionView, indexPath, item) -> UICollectionViewCell? in
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CollectionViewCell.reuseIdentifier, for: indexPath) as? CollectionViewCell else {
                fatalError("Cannot create new cell")
            }
            let urlString = item.photo.urls.thumb
            cell.configure(with: urlString)
            
            return cell
        }
    }
    
    //MARK: - Apply Snapshot
    private func setupBindings() {
        viewModel.onUpdate = { [weak self] in
            DispatchQueue.main.async {
                self?.applySnapshot()
            }
        }
        
        viewModel.onError = { error in
            print("Error fetching photos: \(error)")
        }
    }
    
    //MARK: - Snapshot
    private func applySnapshot() {
        var snapshot = NSDiffableDataSourceSnapshot<Section, Item>()
        snapshot.appendSections([.main])
        snapshot.appendItems(viewModel.items)
        dataSource.apply(snapshot, animatingDifferences: true)
    }
}

//MARK: - CollectionView Delegate
extension GalleryVC: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let items = dataSource.snapshot().itemIdentifiers
        let viewModel = FullScreenViewModel(items: items, initialIndex: indexPath.row)
        let fullScreenVC = FullScreenVC(viewModel: viewModel)
        navigationController?.pushViewController(fullScreenVC, animated: true)
    }
}
