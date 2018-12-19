//
//  MapPinManager.swift
//  MapPin
//

import Foundation

public enum PinSize {
    case normal
    case large
    
    func getSize() -> CGSize {
        switch self {
        case .normal:
            return CGSize(width: 40, height: 60)
        case .large:
            return CGSize(width: 60, height: 80)
        }
    }
}

public class MapPinManager: MapPinManagerProtocol {
    
    let viewController: PinViewController
    
    public init(pinSize: PinSize) {
        let storyBoard = UIStoryboard.init(name: MapPinConstants.pinStoryboardName, bundle: MapPinConstants.mapPinBundle)
        if let viewController = storyBoard.instantiateViewController(withIdentifier: MapPinConstants.pinViewControllerName) as? PinViewController {
            self.viewController = viewController
            self.viewController.loadViewIfNeeded()
        } else {
            self.viewController = PinViewController()
            assertionFailure("Pin view controller is missing.")
        }
        let points = CGPoint(x: self.viewController.view.frame.origin.x, y: self.viewController.view.frame.origin.y)
        let viewFrame = CGRect(origin: points, size: pinSize.getSize())
        self.viewController.view.frame = viewFrame
        self.viewController.updateConstraint(forPinSize: pinSize)
    }
    
    public func getPinView(forPinImage pinImage: UIImage?, withIconImage iconImage: UIImage?, andBorderColor color: UIColor?) -> UIView {
        setViewControllerControls(forPinImage: pinImage, withIconImage: iconImage, andBorderColor: color)
        return getview()
    }
    
    public func getPinImage(forPinImage pinImage: UIImage?, withIconImage iconImage: UIImage?, andBorderColor color: UIColor?) -> UIImage {
        setViewControllerControls(forPinImage: pinImage, withIconImage: iconImage, andBorderColor: color)
        return getImage()
    }
    
    func setViewControllerControls(forPinImage pinImage: UIImage?, withIconImage iconImage: UIImage?, andBorderColor color: UIColor?) {
        viewController.borderImageView.image = pinImage
        viewController.borderImageView.tintColor = color
        viewController.pinImageView.image = pinImage
        viewController.pinIconImageView.image = iconImage
    }
    
    func getview() -> UIView {
        if let view = viewController.view {
            return view
        }
        return UIView()
    }
    
    func getImage() -> UIImage {
        UIGraphicsBeginImageContextWithOptions(viewController.view.frame.size, false, 0.0)
        viewController.view.layer.render(in: UIGraphicsGetCurrentContext()!)
        guard let image = UIGraphicsGetImageFromCurrentImageContext() else {
            return UIImage()
        }
        UIGraphicsEndImageContext()
        return image
    }
}
