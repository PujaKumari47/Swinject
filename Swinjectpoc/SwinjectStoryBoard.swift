//
//  SwinjectStoryBoard.swift
//  Swinjectpoc
//
//  Created by Puja Kumari on 5/11/17.
//  Copyright © 2017 nineleaps. All rights reserved.
//

import Foundation
import SwinjectStoryboard


extension SwinjectStoryboard {
    class func setup() {
        defaultContainer.storyboardInitCompleted(ViewController.self) { r, c in
            c.weatherFetcher = r.resolve(WeatherFetcher.self)
        }
        defaultContainer.register(Networking.self) { _ in Network() }
        defaultContainer.register(WeatherFetcher.self) { r in
            WeatherFetcher(networking: r.resolve(Networking.self)!)
        }
    }
    
}

