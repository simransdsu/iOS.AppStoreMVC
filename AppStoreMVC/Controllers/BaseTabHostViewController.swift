//
//  BaseUIViewController.swift
//  AppStoreMVC
//
//  Created by Simran Preet Narang on 2022-01-07.
//

import UIKit

class BaseTabHostViewController: UIViewController {
    
    init(with title: String? = nil, tabBarImage: UIImage? = nil) {
        super.init(nibName: nil, bundle: nil)
        self.tabBarItem.title = title
        self.tabBarItem.image = tabBarImage
        self.title = title
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.prefersLargeTitles = true
        view.backgroundColor = .systemBackground
    }

    func showErrorAlert(title: String, message: String) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: "OK", style: .default))
        present(alertController, animated: true)
    }
    
    func handleError(error: Error) {
        print("❌", error.localizedDescription)
        print("❌ ❌", error)
        if let apiError = error as? APIError {
            handleAPIError(apiError)
            return
        }
        handleGenericError(error)
    }
    
    private func handleAPIError(_ apiError: APIError) {
        switch(apiError) {
            
        case .non200Response(let httpResponse):
            handleHttpResponseError(httpResponse: httpResponse)
        case .invalidUrl(_):
            showErrorAlert(title: "❌ Error", message: "Something went wrong, please try again.")
        }
    }
    
    private func handleHttpResponseError(httpResponse: HTTPURLResponse?) {
        switch(httpResponse?.statusCode ?? 500)  {
        case 300..<399:
            showErrorAlert(title: "❌ Error", message: "Thing you are trying to find have moved on. Please try again.")
        case 400..<499:
            showErrorAlert(title: "❌ Error", message: "Invalid request. Please try again.")
        default:
            showErrorAlert(title: "❌ Error", message: "Something went terribly wrong on our side. Please try again after some time")
        }
    }
    
    private func handleGenericError(_ error: Error) {
        showErrorAlert(title: "❌ Error", message: "\(error.localizedDescription) Please try again after some time")
    }
}
