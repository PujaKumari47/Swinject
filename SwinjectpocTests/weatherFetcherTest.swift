//
//  weatherFetcherTest.swift
//  Swinjectpoc
//
//  Created by Puja Kumari on 5/12/17.
//  Copyright © 2017 nineleaps. All rights reserved.
//

import XCTest
@testable import Swinjectpoc
class weatherFetcherTest: XCTestCase {
    var weatherFetcher:WeatherFetcher!
    let networking :Networking! = nil
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    func testFetch() {
        weatherFetcher?.fetch {_ in
            
        }
    

}
    
    func testWeatherDecode() {
     var city = City(id: 0, name: "", weather: "")
   
     
        
     
    }
}
