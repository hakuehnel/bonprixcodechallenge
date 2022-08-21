//
//  ListViewController.swift
//  BonprixCodeChallenge
//
//  Created by Hannes Kühnel on 17.08.22.
//

import Foundation
import UIKit
import Resolver

class ListViewController: UIViewController {
    @Injected var viewModel: ListViewModel
    
    // MARK: - views
    private let tableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.register(ListViewCell.self, forCellReuseIdentifier: ListViewCell.identifier)
        tableView.tableFooterView = UIView()
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViews()
        setupConstraints()
        
        setupNavigationBar()
        
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    private func setupNavigationBar() {
        
        navigationItem.title = viewModel.label
        
        navigationController?.navigationBar.prefersLargeTitles = false
        navigationController?.navigationBar.tintColor = .bonprixGray
        navigationItem.backButtonDisplayMode = .minimal
        navigationItem.rightBarButtonItem  = UIBarButtonItem(image: UIImage(systemName: "magnifyingglass"), style: .plain, target: self, action: nil)
    }
    
    private func setupViews() {
        view.backgroundColor = .bonprixBackgroundColor
        
        view.addSubviews([
            tableView,
        ])
        
        guard let teaserUrl = viewModel.image, let url = URL(string: teaserUrl) else {
            return
        }
        
        let headerView = StretchyTableHeaderView(frame: CGRect(x: 0, y: 0, width: view.bounds.width, height: 150))
        
        headerView.loadImage(from: url)
        
        tableView.tableHeaderView = headerView
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 8),
            tableView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -8),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
        ])
    }
    
}

// MARK: - extension UITableViewDelegate, UITableViewDataSource
extension ListViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfSubcategories
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: ListViewCell.identifier, for: indexPath) as? ListViewCell {
            cell.config(item: viewModel.subcategory(at: indexPath.row))
            return cell
        }
        return ListViewCell()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 40
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let subcategory = viewModel.subcategory(at: indexPath.row)
        if !(subcategory.children ?? []).isEmpty {
            let listViewController: ListViewController = Resolver.resolve()
            listViewController.viewModel.setCategory(subcategory)
            navigationController?.pushViewController(listViewController, animated: true)
        } else if let urlAsString = subcategory.url {
            let webViewController: WebViewController = Resolver.resolve()
            webViewController.configure(title: subcategory.label, urlAsString: urlAsString)
            navigationController?.pushViewController(webViewController, animated: true)
        }
        tableView.deselectRow(at: indexPath, animated: false)
    }
}

// MARK: - StretchyTableHeaderView scroll logic
extension ListViewController: UIScrollViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        guard let headerView = tableView.tableHeaderView as? StretchyTableHeaderView else { return }
        headerView.scrollViewDidScroll(scrollView: scrollView)
    }
}
