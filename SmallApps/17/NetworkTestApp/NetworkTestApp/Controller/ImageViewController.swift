//
//  ImageViewController.swift
//  NetworkTestApp
//
//  Created by Andrey Khyshov on 23.07.2021.
//

import UIKit

final class ImageViewController: BaseViewController {

    // MARK: - Dependencies

    private let networkService: TwitchNetworkServiceProtocol
    private let imageUrl: String

    // MARK: - Init

    init(networkService: TwitchNetworkServiceProtocol, imageUrl: String) {
        self.networkService = networkService
        self.imageUrl = imageUrl
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - UI

    private let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        configureUI()
        loadData()
    }

    deinit {
        print("ImageViewController deinit")
    }

    // MARK: - Private methods

    private func configureUI() {
        view.addSubview(imageView)
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: view.topAnchor),
            imageView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            imageView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            imageView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }

    private func loadData() {
        self.isLoading = true
        networkService.loadImage(imageUrl: imageUrl) { data in
            if let data = data, let image = UIImage(data: data) {
                DispatchQueue.main.async {
                    self.imageView.image = image
                    self.isLoading = false
                }
            }
        }
    }
}
