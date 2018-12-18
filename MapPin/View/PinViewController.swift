//
//  PinViewController.swift
//  MapPin
//

import UIKit

class PinViewController: UIViewController {

    @IBOutlet weak var borderImageView: UIImageView!
    @IBOutlet weak var pinImageView: UIImageView!
    @IBOutlet weak var pinIconImageView: UIImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    func setupUI() {
        borderImageView.setImage(renderingMode: .alwaysTemplate)
        pinImageView.setImage(renderingMode: .alwaysTemplate)
        pinIconImageView.setImage(renderingMode: .alwaysTemplate)
    }
}
