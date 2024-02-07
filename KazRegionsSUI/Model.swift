//
//  Model.swift
//  KazRegionsSUI
//
//  Created by Aset Bakirov on 07.02.2024.
//

import Foundation
import SwiftyJSON

struct Region: Identifiable {
    var id = UUID()
    var name = ""
    var mainCity = ""
    var population = ""
    var emblem = ""
    var photo = ""
    
    init(json: JSON) {
        if let item = json["name"].string {
            name = item
        }
        if let item = json["mainCity"].string {
            mainCity = item
        }
        if let item = json["population"].string {
            population = item
        }
        if let item = json["emblem"].string {
            emblem = item
        }
        if let item = json["photo"].string {
            photo = item
        }
    }
}
