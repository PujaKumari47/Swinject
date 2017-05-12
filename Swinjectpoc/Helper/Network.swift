//
//  Networking.swift
//  Swinjectpoc
//
//  Created by Puja Kumari on 5/9/17.
//  Copyright © 2017 nineleaps. All rights reserved.
//

import Foundation
import Alamofire

protocol Networking {
 func request(_ networkResponse: @escaping (Data?) -> ())
}
