//
//  MoviesListViewController.swift
//  DesafioIOS
//
//  Created by Emerson Carpes on 13/11/22.
//

import UIKit

class MoviesListViewController: UIViewController {
    
    lazy private var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: (UIScreen.main.bounds.width - 80) / 3, height: 200)
        layout.scrollDirection = .vertical
        layout.sectionInset = UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 20)
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.dataSource = self
        collectionView.delegate = self
        
        return collectionView
    }()
    
    weak private var coordinator: MoviesListCoordinator?
    private var viewModel: MoviesListViewModel
    
    init(coordinator: MoviesListCoordinator?, viewModel: MoviesListViewModel) {
        self.coordinator = coordinator
        self.viewModel = viewModel

        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
        registerCells()
        bindViewModel()
    }
    
    private func setupUI() {
        view.addSubview(collectionView)
        
        collectionView.anchor(top: (anchor: view.topAnchor, padding: 0),
                              left: (anchor: view.leadingAnchor, padding: 0),
                              right: (anchor: view.trailingAnchor, padding: 0),
                              bottom: (anchor: view.bottomAnchor, padding: 0))
    }
    
    private func bindViewModel() {
        viewModel.onUpdateUI = { [weak self] in
            DispatchQueue.main.async {
                self?.collectionView.reloadData()
            }
        }

        viewModel.fetchComics(offset: viewModel.offset)
    }
    
    private func registerCells() {
        collectionView.register(MovieCollectionViewCell.self, forCellWithReuseIdentifier: String(describing: MovieCollectionViewCell.self))
    }
}

extension MoviesListViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        viewModel.movies.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: String(describing: MovieCollectionViewCell.self), for: indexPath) as? MovieCollectionViewCell else {
            return UICollectionViewCell()
        }
        
        cell.config(movie: viewModel.movies[indexPath.row])
        
        return cell
    }
}

extension MoviesListViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        coordinator?.didSelect(viewModel.movies[indexPath.row])
    }
    
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        
        if viewModel.shouldGetNextPage(row: indexPath.row) {
            viewModel.fetchComics(offset: viewModel.offset)
        }
    }
}
