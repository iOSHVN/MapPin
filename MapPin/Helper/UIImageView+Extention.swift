//
//  UIImageView+Extention.swift
//  MapPin
//

import Foundation

extension UIImageView {
    func setImage(renderingMode mode: UIImage.RenderingMode = .alwaysOriginal) {
        image = image?.withRenderingMode(mode)
    }
}
