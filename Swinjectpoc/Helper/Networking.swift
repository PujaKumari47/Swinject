//
//  Protocol.swift
//  Swinjectpoc
//
//  Created by Puja Kumari on 5/11/17.
//  Copyright © 2017 nineleaps. All rights reserved.
//

import Foundation
import Alamofire

struct Network : Networking {
    func request(_ networkResponse: @escaping (Data?) -> ()) {
         let apiKey = "6eb97fa5ca854a32a1fb42ec4bb7e031"
        
         let cityIds = [
            6077243, 524901, 5368361, 1835848, 3128760, 4180439,
            2147714, 264371, 1816670, 2643743, 3451190, 1850147
        ]
        var url = "http://api.openweathermap.org/data/2.5/group"
        var parameters: [String: String] {
            return [
                "APPID": apiKey,
                "id": cityIds.map { String($0) }.joined(separator: ",")
            ]
        }
        Alamofire.request(url,parameters:parameters).responseData { (dataResponse) in
            networkResponse(dataResponse.data)
        }
    }
}
