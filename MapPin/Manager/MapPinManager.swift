//
//  MapPinManager.swift
//  MapPin
//

import Foundation

public class MapPinManager: MapPinManagerProtocol {
    
    let viewController: PinViewController
    
    public init() {
        let storyBoard = UIStoryboard.init(name: MapPinConstants.pinStoryboardName, bundle: Bundle(identifier: "org.cocoapods.MapPin"))
        if let viewController = storyBoard.instantiateViewController(withIdentifier: MapPinConstants.pinViewControllerName) as? PinViewController {
            self.viewController = viewController
            self.viewController.loadViewIfNeeded()
        } else {
            self.viewController = PinViewController()
            assertionFailure("Pin view controller is missing.")
        }
    }
    
    public convenience init(viewFrameSize: CGSize) {
        self.init()
        let points = CGPoint(x: self.viewController.view.frame.origin.x, y: self.viewController.view.frame.origin.y)
        let viewFrame = CGRect(origin: points, size: viewFrameSize)
        self.viewController.view.frame = viewFrame
    }
    
    public convenience init(viewFrameSize: CGSize, iconFrameSize: CGSize) {
        self.init(viewFrameSize: viewFrameSize)
        self.viewController.pinIconImageView.frame.size = iconFrameSize
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
