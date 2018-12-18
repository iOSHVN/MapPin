//
//  MapPinManagerTests.swift
//  MapPinTests
//

import XCTest
@testable import MapPin

class MapPinManagerTests: XCTestCase {

    var pinManager: MapPinManager!
    
    override func setUp() {
        pinManager = MapPinManager(viewFrameSize: CGSize(width: 39, height: 58), iconFrameSize: CGSize(width: 25, height: 25))
    }

    override func tearDown() {
        pinManager = nil
    }
    
    func testThatGetImage() {
        let mapPinImage = UIImage(named: "MapPin.jpg", in: Bundle(identifier: "org.cocoapods.MapPinTests"), compatibleWith: nil)
        let iconImage = UIImage(named: "IconImage.png", in: Bundle(identifier: "org.cocoapods.MapPinTests"), compatibleWith: nil)
        let borderColor = UIColor.black
        let image = pinManager.getPinImage(forPinImage: mapPinImage, withIconImage: iconImage, andBorderColor: borderColor)
        XCTAssertTrue(image != UIImage())
    }
    
    func testThatGetImageWithoutIconImage() {
        let mapPinImage = UIImage(named: "MapPin.jpg", in: Bundle(identifier: "org.cocoapods.MapPinTests"), compatibleWith: nil)
        let borderColor = UIColor.black
        let image = pinManager.getPinImage(forPinImage: mapPinImage, withIconImage: nil, andBorderColor: borderColor)
        XCTAssertTrue(image != UIImage())
    }
    
    func testThatGetView() {
        let mapPinImage = UIImage(named: "MapPin.jpg", in: Bundle(identifier: "org.cocoapods.MapPinTests"), compatibleWith: nil)
        let iconImage = UIImage(named: "IconImage.png", in: Bundle(identifier: "org.cocoapods.MapPinTests"), compatibleWith: nil)
        let borderColor = UIColor.black
        let view = pinManager.getPinView(forPinImage: mapPinImage, withIconImage: iconImage, andBorderColor: borderColor)
        XCTAssertTrue(view != UIView())
    }
    
    func testThatGetViewWithoutIconView() {
        let mapPinImage = UIImage(named: "MapPin.jpg", in: Bundle(identifier: "org.cocoapods.MapPinTests"), compatibleWith: nil)
        let borderColor = UIColor.black
        let view = pinManager.getPinView(forPinImage: mapPinImage, withIconImage: nil, andBorderColor: borderColor)
        XCTAssertTrue(view != UIView())
    }
}
