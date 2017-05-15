//
//  ViewControllerTests.swift
//  Swinjectpoc
//
//  Created by Puja Kumari on 5/12/17.
//  Copyright © 2017 nineleaps. All rights reserved.
//

import XCTest
import SwinjectStoryboard
import SwiftyJSON
import Alamofire

@testable import Swinjectpoc
class ViewControllerTests: XCTestCase {
    var viewController:ViewController!
    
    
    
    override func setUp() {
        super.setUp()
        let storyBoard:UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        viewController = storyBoard.instantiateViewController(withIdentifier: "ViewController") as! ViewController
        UIApplication.shared.keyWindow?.rootViewController = viewController
        
        _ = viewController.view
       
        
    }
    func testAlertMessage() {
        viewController.callWeatherFetch()
        
        if let cities :AnyObject? = nil {
        self.viewController.weatherFetcher?.fetch(response: cities as! ([City]?) -> ())
            
        }
        
        
        XCTAssertFalse(viewController.presentedViewController is UIAlertController)
       
        
    
    }
    func testSetProtocol() {
        XCTAssert(viewController.conforms(to: UITableViewDataSource.self))
        XCTAssert(viewController.conforms(to: UITableViewDelegate.self))
      
    }
    func testNumberOfSections() {
        let section = viewController.numberOfSections(in: viewController.weatherTableView)
        XCTAssertEqual(section, 1)
    }
    
    func testTableNumberOfRows() {
        let rows = viewController.tableView(viewController.weatherTableView, numberOfRowsInSection:0)
        XCTAssertEqual(rows,viewController.cities.count)
       
    }
    

    func testTableViewCellForRowAtIndexPath() {
        let city = City(id: 01, name: "Ranchi", weather: "Cold")
        let cityArray: [City] = [city]
        viewController.cities = cityArray
        viewController.weatherTableView.reloadData()
        let indexPath = NSIndexPath(row: 0, section: 0) as IndexPath
        let cell =  viewController.tableView(viewController.weatherTableView, cellForRowAt: indexPath) as! WeatherTableViewCell
        XCTAssertNotNil(cell)
        XCTAssertEqual(cell.weatherLabel.text!, "Cold")
        XCTAssertEqual(cell.placeLabel.text!, "Ranchi")
   
    }
}
