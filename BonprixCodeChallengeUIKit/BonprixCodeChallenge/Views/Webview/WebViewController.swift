//
//  ShopViewController.swift
//  BonprixCodeChallenge
//
//  Created by Hannes Kühnel on 17.08.22.
//

import UIKit
import WebKit

class WebViewController: UIViewController {
    private var urlAsString = "https://www.bonprix.de/"
    
    // MARK: - views
    private let progressView: UIProgressView = {
        let progressView = UIProgressView(progressViewStyle: .default)
        progressView.progressTintColor = .bonprixRed
        progressView.translatesAutoresizingMaskIntoConstraints = false
        progressView.isHidden = false
        return progressView
    }()
    
    private let bonprixTitleLabel: UILabel = {
        let label = UILabel()
        label.textColor = .bonprixRed
        label.font = .ubuntuMedium
        label.text = "bon\nprix"
        label.numberOfLines = 2
        return label
    }()
    
    private let webViewConfiguration: WKWebViewConfiguration = {
        // remove header on home tab via JS injection
        let contentController = WKUserContentController()
        let scriptSource =
"""
        if(document.getElementById('header'))document.getElementById('header').style.display='none';
        if(document.getElementById('content'))document.getElementById('content').style.paddingTop='0';
"""
        let script = WKUserScript(source: scriptSource, injectionTime: .atDocumentEnd, forMainFrameOnly: true)
        contentController.addUserScript(script)
        
        let configuration = WKWebViewConfiguration()
        configuration.userContentController = contentController
        return configuration
    }()
    
    private lazy var webView: WKWebView = {
        let webView = WKWebView(frame: .zero, configuration: webViewConfiguration)
        webView.translatesAutoresizingMaskIntoConstraints = false
        webView.allowsBackForwardNavigationGestures = true
        return webView
    }()
    
    private var progressObservation: NSKeyValueObservation?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViews()
        setupConstraints()
        
        navigationController?.navigationBar.tintColor = .bonprixGray
        
        loadWebview()
        
        // 'inspired' by https://stackoverflow.com/a/53268834
        let refreshControl = UIRefreshControl()
        refreshControl.addTarget(self, action: #selector(reloadWebView(_:)), for: .valueChanged)
        webView.scrollView.addSubview(refreshControl)
    }
    
    func configure(title: String?, urlAsString: String) {
        navigationItem.title = title
        self.urlAsString = urlAsString
        
        navigationItem.rightBarButtonItem  = UIBarButtonItem(image: UIImage(systemName: "magnifyingglass"), style: .plain, target: self, action: nil)
    }
    
    func configureHomePage() {
        navigationItem.titleView = bonprixTitleLabel
        navigationItem.searchController = UISearchController()
    }
    
    @objc private func reloadWebView(_ sender: UIRefreshControl) {
        webView.reload()
        sender.endRefreshing()
    }
    
    private func loadWebview() {
        guard let bonprixHomeUrl = URL(string: urlAsString) else { return }
        webView.load(URLRequest(url: bonprixHomeUrl))
        webView.navigationDelegate = self
        
        progressObservation = webView.observe(\.estimatedProgress, options: [.new]) { [weak self] webView, _ in
            self?.progressView.progress = Float(webView.estimatedProgress)
        }
    }
    
    private func setupViews() {
        view.backgroundColor = .white
        
        view.addSubviews([
            progressView,
            webView,
        ])
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            progressView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            progressView.leftAnchor.constraint(equalTo: view.leftAnchor),
            progressView.rightAnchor.constraint(equalTo: view.rightAnchor),
            progressView.heightAnchor.constraint(equalToConstant: 2.0),
            
            webView.topAnchor.constraint(equalTo: progressView.bottomAnchor),
            webView.leftAnchor.constraint(equalTo: view.leftAnchor),
            webView.rightAnchor.constraint(equalTo: view.rightAnchor),
            webView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
        ])
    }
    
    deinit {
        webView.stopLoading()
    }
}

// MARK: - WKNavigationDelegate
extension WebViewController: WKNavigationDelegate {
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        progressView.isHidden = true
        
        // remove the header after loading is finished for non-home-page urls
        webView.evaluateJavaScript("document.getElementsByClassName('header__wrapper')[0].style.display='none'")
        webView.evaluateJavaScript("document.getElementsByClassName('page')[0].style.paddingTop='0'")
    }
}
