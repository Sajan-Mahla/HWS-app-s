//
//  UserLocation.swift
//  Bucket List
//
//  Created by SAJAN  on 23/09/25.
//

import MapKit
import SwiftUI

struct UserLocation: View {
    let startPostion = MapCameraPosition.region(
        MKCoordinateRegion(
            center: CLLocationCoordinate2D(latitude: 56, longitude: -3),
            span: MKCoordinateSpan(latitudeDelta: 10, longitudeDelta: 10))
    )
    
    @State private var locations = [location]()
    @State private var selectedPlace: location?
    var body: some View {
        MapReader{ proxy in
            Map(initialPosition: startPostion){
                ForEach(locations) {location in
                    Annotation(location.name, coordinate: location.Coordinate){
                        Image(systemName: "star.circle")
                            .resizable()
                            .foregroundStyle(.red)
                            .frame(width: 44, height: 44)
                            .clipShape(.circle)
                            .onLongPressGesture{
                                selectedPlace = location
                            }
                    }
                }
            }
                .onTapGesture { position in
                    if let coordinate = proxy.convert(position, from: .local){
                        let NewLocation = location(id: UUID(), name: "NewLocation", description: "", latitude: coordinate.latitude, Longitude: coordinate.longitude)
                        locations.append(NewLocation)
                    }
                }
                .sheet(item: $selectedPlace) { place in
                    Text(place.name)}
        }
    }
}

#Preview {
    UserLocation()
}
