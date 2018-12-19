//
//  PinViewController.swift
//  MapPin
//

import UIKit

class PinViewController: UIViewController {

    @IBOutlet weak var borderImageView: UIImageView!
    @IBOutlet weak var pinImageView: UIImageView!
    @IBOutlet weak var pinIconImageView: UIImageView!
    @IBOutlet weak var pinIconLeadingConstraint: NSLayoutConstraint!
    @IBOutlet weak var pinIconTrailingConstraint: NSLayoutConstraint!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    func setupUI() {
        borderImageView.setImage(renderingMode: .alwaysTemplate)
        pinImageView.setImage(renderingMode: .alwaysTemplate)
        pinIconImageView.setImage(renderingMode: .alwaysTemplate)
    }
    
    func updateConstraint(forPinSize pinSize: PinSize) {
        switch pinSize {
        case .large:
            pinIconLeadingConstraint.constant = 20.0
            pinIconTrailingConstraint.constant = 20.0
        case .normal:
            pinIconLeadingConstraint.constant = 10.0
            pinIconTrailingConstraint.constant = 10.0
        }
    }
}
