//
//  ViewController.swift
//  HW23
//
//  Created by Злата Лашкевич on 3.11.24.
//

import UIKit
import WebKit

class ViewController: UIViewController {
    
    lazy var mainStackView = UIStackView()
    lazy var searchStackView = UIStackView()
    lazy var leftButton = ButtonViewController(image: UIImage(systemName: "arrowshape.left.fill"))
    lazy var rightButton = ButtonViewController(image: UIImage(systemName: "arrowshape.right"))
    lazy var bookmark = ButtonViewController(image: UIImage(systemName: "house"))
    lazy var addBookmark = ButtonViewController(image: UIImage(systemName: "plus"))
    lazy var reloadButton = ButtonViewController(image: UIImage(systemName: "arrow.uturn.right"))
    lazy var searchView = UITextView()
    lazy var searchButton = ButtonViewController(image: UIImage(systemName: "magnifyingglass"))

    
    var webView = WKWebView()
    
    var firstView: [URL] = []
    var nextUrl: [URL] = []
    var boormarkUrl: [URL] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(mainStackView)
        view.addSubview(searchStackView)
        
        mainStackView.translatesAutoresizingMaskIntoConstraints = false
        mainStackView.axis = .horizontal
        mainStackView.distribution = .equalSpacing
        mainStackView.spacing = 50
        mainStackView.backgroundColor = .gray
        mainStackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -10).isActive = true
        mainStackView.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor).isActive = true
        mainStackView.addArrangedSubview(leftButton)
        mainStackView.addArrangedSubview(rightButton)
        mainStackView.addArrangedSubview(addBookmark)
        mainStackView.addArrangedSubview(reloadButton)
        mainStackView.addArrangedSubview(bookmark)
        
        leftButton.setTitle("", for: .normal)
        leftButton.setTitleColor(.blue, for: .normal)
        leftButton.backgroundColor = .gray
        
        rightButton.setTitle("", for: .normal)
        rightButton.setTitleColor(.blue, for: .normal)
        rightButton.backgroundColor = .gray
        
        addBookmark.setTitle("", for: .normal)
        addBookmark.setTitleColor(.blue, for: .normal)
        addBookmark.backgroundColor = .gray
        
        reloadButton.setTitle("", for: .normal)
        reloadButton.setTitleColor(.blue, for: .normal)
        reloadButton.backgroundColor = .gray
        
        bookmark.setTitle("", for: .normal)
        bookmark.setTitleColor(.blue, for: .normal)
        bookmark.backgroundColor = .gray
        
        
        searchStackView.translatesAutoresizingMaskIntoConstraints = false
        searchStackView.bottomAnchor.constraint(equalTo: mainStackView.topAnchor).isActive = true
        searchStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 15).isActive = true
        searchStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -15).isActive = true
        searchStackView.distribution = .fill
        searchStackView.axis = .horizontal
        searchStackView.addArrangedSubview(searchView)
        searchStackView.addArrangedSubview(searchButton)
        
        
        leftButton.addTarget(self, action: #selector(goLeftButton), for: .touchUpInside)
        rightButton.addTarget(self, action: #selector(goRightButton), for: .touchUpInside)
        addBookmark.addTarget(self, action: #selector(goBookmarkButton), for: .touchUpInside)
        reloadButton.addTarget(self, action: #selector(goReloadButton), for: .touchUpInside)
        searchButton.addTarget(self, action: #selector(goSearchButton), for: .touchUpInside)
        bookmark.addTarget(self, action: #selector(goSetBookmarkButton), for: .touchUpInside)
        
    }
    
    func webViewSetup(){
        webView.navigationDelegate = self
        webView.allowsBackForwardNavigationGestures = true
    }
    
    func disableButton(){
        leftButton.isEnabled = false
        rightButton.isEnabled = false
        addBookmark.isEnabled = false
        reloadButton.isEnabled = false
    }
    
    @objc func goLeftButton(){
        if firstView.count >= 1 {
            firstView.removeLast()
            if let url = webView.url {
                nextUrl.append(url)
            }
        }
        guard let url = firstView.last else {return}
        webView.load(URLRequest(url: url))
        disableButton()
    }
    
    @objc func goRightButton(){
        if nextUrl.count >= 1 {
            guard let url = nextUrl.last else {return}
            webView.load(URLRequest(url: url))
            nextUrl.removeLast()
        }
        if let url = webView.url {
            firstView.append(url)}
        disableButton()
        
    }
    
    
    @objc func goSearchButton(){
        guard let url = URL(string: ("https://" + (searchView.text ?? ""))) else {return}
        webView.load(URLRequest(url: url))
        view.endEditing(true)
        
        if let url = webView.url {
            firstView.append(url)}
    }
    
    @objc func goBookmarkButton(){
        let viewControllerz = BookMarkViewController()
        viewControllerz.bookmarks = self.boormarkUrl
        present(viewControllerz, animated: true)
        
    }
    
    @objc func goReloadButton(){
        guard let url = webView.url else {return}
        webView.load(URLRequest(url: url))
    }
    
    @objc func goSetBookmarkButton(){
        guard let url = webView.url else {return}
        boormarkUrl.append(url)
        addBookmark.isEnabled = false
    }
    
}

extension ViewController: WKNavigationDelegate {
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        searchView.text = ""
        
    }
}
