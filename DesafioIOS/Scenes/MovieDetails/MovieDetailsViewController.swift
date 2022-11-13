//
//  MovieDetailsViewController.swift
//  DesafioIOS
//
//  Created by Emerson Carpes on 13/11/22.
//

import UIKit

class MovieDetailsViewController: UIViewController {

    lazy private var imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleToFill
        return imageView
    }()
    
    lazy private var stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 8
        return stackView
    }()
    
    lazy private var nameLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        return label
    }()
    
    lazy private var issueLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14, weight: .medium)
        return label
    }()
    
    lazy private var priceLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 12, weight: .regular)
        return label
    }()
    
    lazy private var buyButton: UIButton = {
        let button = UIButton()
        button.setTitle("COMPRAR", for: .normal)
        button.layer.cornerRadius = 8
        button.backgroundColor = .systemRed
        return button
    }()
    
    weak var coordinator: MovieDetailsCoordinator?
    private var viewModel: MovieDetailsViewModel
    
    init(coordinator: MovieDetailsCoordinator?, viewModel: MovieDetailsViewModel) {
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
        setupData()
    }
    
    private func setupUI() {
        view.backgroundColor = .systemBackground
        
        view.addSubview(imageView)
        view.addSubview(stackView)
        view.addSubview(buyButton)
        
        imageView.anchor(top: (anchor: view.safeAreaLayoutGuide.topAnchor, padding: 20),
                         left: (anchor: view.leadingAnchor, padding: 20),
                         width: 150,
                         height: 226)
        
        stackView.anchor(top: (anchor: view.safeAreaLayoutGuide.topAnchor, padding: 20),
                         left: (anchor: imageView.trailingAnchor, padding: 20),
                         right: (anchor: view.trailingAnchor, padding: 20))
        
        buyButton.anchor(left: (anchor: imageView.trailingAnchor, padding: 20),
                         right: (anchor: view.trailingAnchor, padding: 20),
                         bottom: (anchor: imageView.bottomAnchor, padding: 0),
                         height: 40)
    }
    
    private func setupData() {
        imageView.kf.setImage(with: URL(string: "\(viewModel.movie.thumbnail.path).\(viewModel.movie.thumbnail.format)"))
        nameLabel.text = viewModel.movie.title
        stackView.addArrangedSubview(nameLabel)
        
        issueLabel.text = "# \(viewModel.movie.issueNumber)"
        stackView.addArrangedSubview(issueLabel)
        
        priceLabel.text = "R$ \(viewModel.movie.prices.first?.price ?? 0.0)"
        stackView.addArrangedSubview(priceLabel)
    }
}
