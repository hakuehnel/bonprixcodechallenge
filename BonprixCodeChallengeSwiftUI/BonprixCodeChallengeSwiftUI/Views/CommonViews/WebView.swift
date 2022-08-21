//
//  WebView.swift
//  BonprixCodeChallengeSwiftUI
//
//  Created by Hannes Kühnel on 19.08.22.
//

import Foundation
import WebKit
import SwiftUI

struct WebView: UIViewRepresentable {
    var urlAsString: String
    
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
    
    func makeUIView(context: Context) -> WKWebView {
        guard let url = URL(string: urlAsString) else {
            return WKWebView()
        }
        
        let webView = WKWebView(frame: .zero, configuration: webViewConfiguration)
        webView.allowsBackForwardNavigationGestures = true
        
        let request = URLRequest(url: url)
        webView.load(request)
        
        return webView
    }
    
    func updateUIView(_ uiView: WKWebView, context: Context) {
    }
}
