//
//  MapPinManagerProtocol.swift
//  MapPin
//

import Foundation

protocol MapPinManagerProtocol {
    func getPinView(forPinImage pinImage: UIImage?, withIconImage iconImage: UIImage?, andBorderColor color: UIColor?) -> UIView
    func getPinImage(forPinImage pinImage: UIImage?, withIconImage iconImage: UIImage?, andBorderColor color: UIColor?) -> UIImage
}
