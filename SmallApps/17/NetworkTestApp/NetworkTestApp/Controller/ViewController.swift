//
//  ViewController.swift
//  NetworkTestApp
//
//  Created by Andrey Khyshov on 23.07.2021.
//

import UIKit

class ViewController: BaseViewController {

    // MARK: - Dependencies

    private let networkService: TwitchNetworkServiceProtocol

    // MARK: - Init

    init(networkService: TwitchNetworkServiceProtocol) {
        self.networkService = networkService
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Life cycle

    override func viewDidLoad() {
        super.viewDidLoad()

        configureUI()
        loadData()
    }

    // MARK: - UI

    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.register(GameCell.self, forCellReuseIdentifier: GameCell.indentifirer)
        tableView.dataSource = self
        tableView.delegate = self
        tableView.showsVerticalScrollIndicator = false
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()

    // MARK: - Internal Properties

    private var cursor: String?
    private var dataSource = [GetGamesDataResponse]()

    // MARK: - Private methods

    private func configureUI() {
        view.addSubview(tableView)
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }

    private func loadData() {
        isLoading = true
        networkService.authorize { [weak self] result in
            guard let self = self else { return }
            switch result {
            case .success:
                self.networkService.getGames(after: nil) { self.process($0) }
            case .failure(let error):
                self.showAlert(for: error)
            }
        }
    }

    private func process(_ response: GetGamesAPIResponse) {
        DispatchQueue.main.async {
            switch response {
            case .success(let data):
                self.cursor = data.pagination.cursor
                self.dataSource.append(contentsOf: data.data)
                self.tableView.reloadData()
            case .failure(let error):
                self.showAlert(for: error)
            }
            self.isLoading = false
        }
    }

    private func showAlert(for error: NetworkServiceError) {
        DispatchQueue.main.async {
            let alert = UIAlertController(title: "Опаньки, что-то пошло не так!",
                                          message: error.message,
                                          preferredStyle: .alert)
            self.present(alert, animated: true)
        }
    }
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        dataSource.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: GameCell.indentifirer, for: indexPath)
        (cell as? GameCell)?.configure(with: dataSource[indexPath.row])
        return cell
    }
}

extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        if indexPath.row == dataSource.count - 1, !isLoading {
            isLoading = true
            networkService.getGames(after: cursor) { [weak self] in self?.process($0) }
        }
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let viewController = ImageViewController(networkService: networkService, imageUrl: dataSource[indexPath.row].boxArtUrl)
        navigationController?.present(viewController, animated: true, completion: nil)
    }
}
