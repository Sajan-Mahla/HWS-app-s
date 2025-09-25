//
//  Location.swift
//  Bucket List
//
//  Created by SAJAN  on 23/09/25.
//

import Foundation
import MapKit

struct location: Codable, Equatable, Identifiable {
let id: UUID
var name: String
var description: String
var latitude: Double
var Longitude: Double
    
    
    var Coordinate: CLLocationCoordinate2D{
        CLLocationCoordinate2D(latitude: latitude, longitude: Longitude)
    }
    #if DEBUG
    static let example = location(id: UUID(), name: "Buckhigam Palace", description: "Lit by over 40,000 LightsBulbs.", latitude: 51.501, Longitude: -0.141)
    #endif
    
    static func ==(lhs: location, rhs: location) -> Bool {
        lhs.id == rhs.id
    }
}
