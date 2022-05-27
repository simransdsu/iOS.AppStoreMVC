//
//  UIViewController+Extensions.swift
//  AppStoreMVC
//
//  Created by Simran Preet Narang on 2022-05-26.
//

import Foundation
import UIKit

extension UIViewController {
    
    /// Background color of the view in the view controllerr
    var backgroundColor: UIColor? {
        get {
            return view.backgroundColor
        }
        set {
            view.backgroundColor = newValue
        }
    }
    
    /// Corner Radius of the view in the view controllerr
    var cornerRadius: CGFloat {
        get {
            return view.layer.cornerRadius
        }
        set {
            view.layer.cornerRadius = newValue
        }
    }
    
    /// When true an implicit mask matching the layer bounds is applied to
    /// the layer (including the effects of the `cornerRadius' property). If
    /// both `mask' and `masksToBounds' are non-nil the two masks are
    /// multiplied to get the actual mask values. Defaults to NO.
    /// Animatable.
    var masksToBounds: Bool {
        get {
            return view.layer.masksToBounds
        }
        set {
            view.layer.masksToBounds = newValue
        }
    }
    
    /// Height of the view in the ViewController
    var height: CGFloat {
        get {
            return view.frame.height
        }
    }
    
    /// Width of the view in the ViewController
    var width: CGFloat {
        get {
            return view.frame.width
        }
    }
    
    /// Returns the x- coordinate that establishes the center of a rectangle
    var midX: CGFloat {
        get {
            return view.bounds.midX
        }
    }
    
    /// Returns the y-coordinate that establishes the center of the rectangle.
    var midY: CGFloat {
        get {
            return view.bounds.midY
        }
    }
    
    /// A point that specifies the coordinates of the rectangle’s origin.
    var boundsOrigin: CGPoint {
        get {
            return view.bounds.origin
        }
    }
    
    /// A size that specifies the height and width of the rectangle.
    var boundsSize: CGSize {
        get {
            return view.bounds.size
        }
    }
    
    // Route to the ViewController on which it is called
    func route(from viewController: UIViewController, navigationStyle: NavigationStyle = .push) {
        
        switch navigationStyle {
        case .sheet:
            viewController.present(self, animated: true)
        case .sheetWithNavigation:
            viewController.present(UINavigationController(rootViewController: self), animated: true)
        case .fullScreen:
            self.modalPresentationStyle = .fullScreen
            viewController.present(self, animated: true)
        case .fullScreenWithNavigation:
            self.modalPresentationStyle = .fullScreen
            viewController.present(UINavigationController(rootViewController: self), animated: true)
        case .push:
            viewController.navigationController?.pushViewController(self, animated: true)
        }
    }
    
    enum NavigationStyle {
        case sheet
        case sheetWithNavigation
        case push
        case fullScreen
        case fullScreenWithNavigation
    }
}
