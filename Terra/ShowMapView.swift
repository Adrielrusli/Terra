//
//  ShowMapView.swift
//  Terra
//
//  Created by Dwianditya Hanif Raharjanto on 08/10/23.
//

import CoreLocationUI
import MapKit
import SwiftUI

struct ShowMapView: View {
//    @State private var path: [Int] = []
    @State var isActive: Bool = false
    @State private var mapUserTrackingMode: MapUserTrackingMode = .follow
    @State private var region = MKCoordinateRegion(
        center: CLLocationCoordinate2D(latitude: 37.765205,
                                       longitude: -122.241638),
        latitudinalMeters: 100000,
        longitudinalMeters: 100000
    )
    @StateObject private var viewModel = LocationViewModel()
    
    @State var destination: String = ""
    @State var searchresultopen: Bool = false
    @State private var annotations = [
        BeachCoord(coordinate: CLLocationCoordinate2D(latitude: 37.765205, longitude: -122.241638), title: 84),
        BeachCoord(coordinate: CLLocationCoordinate2D(latitude: 39.2087, longitude: -122.0057), title:64),
        BeachCoord(coordinate: CLLocationCoordinate2D(latitude: 37.934490, longitude: -122.068848), title: 80),
        BeachCoord(coordinate: CLLocationCoordinate2D(latitude: 41.7076, longitude: -123.9660), title: 86),
        BeachCoord(coordinate: CLLocationCoordinate2D(latitude: 36.746841, longitude: -119.772591), title: 17),
        BeachCoord(coordinate: CLLocationCoordinate2D(latitude: 41.593147, longitude: -118.550095), title: 77),
        BeachCoord(coordinate: CLLocationCoordinate2D(latitude: 34.052235, longitude: -118.243683), title: 10),
        BeachCoord(coordinate: CLLocationCoordinate2D(latitude: 37.325954, longitude: -120.499992), title: 71),
        BeachCoord(coordinate: CLLocationCoordinate2D(latitude: 39.0600, longitude: 120.7300), title: 84),
        BeachCoord(coordinate: CLLocationCoordinate2D(latitude: 38.575764, longitude: -121.478851), title: 72),
        BeachCoord(coordinate: CLLocationCoordinate2D(latitude: 36.6240, longitude: -120.1843), title: 71),
        BeachCoord(coordinate: CLLocationCoordinate2D(latitude: 41.5900, longitude:-122.5300), title: 80),
        BeachCoord(coordinate: CLLocationCoordinate2D(latitude: 38.3105, longitude: -121.9018), title: 64),
        BeachCoord(coordinate: CLLocationCoordinate2D(latitude: 37.5600, longitude: -120.9900), title: 13),
        BeachCoord(coordinate: CLLocationCoordinate2D(latitude: 39.163074, longitude: -121.750145), title: 73),
        BeachCoord(coordinate: CLLocationCoordinate2D(latitude: 40.6600, longitude: -123.1200), title: 86),
        BeachCoord(coordinate: CLLocationCoordinate2D(latitude: 38.7329679, longitude: -121.807281), title: 64),
    ]
    
//    var searchResults: [Location] {
//        if destination.isEmpty {
//            return locations
//        } else {
//            return locations.filter { $0.destinationPoint.contains(destination) }
//        }
//    }
    
    var body: some View {
        
        NavigationView {
            ZStack () {
                Map(
                    coordinateRegion: $region,
                    showsUserLocation: true,
                    userTrackingMode: $mapUserTrackingMode,
                    annotationItems: annotations
                ) { annotation in
                    MapAnnotation(coordinate: annotation.coordinate) {
                        VStack {
                            Text(String(annotation.title))
                                .padding()
                                    .background(
                                        Rectangle()
                                            .foregroundColor(TextViewModel(isqa: annotation.title).getStatusColor())
                                            .cornerRadius(20)
                                    )
                                    .foregroundColor(.white)
                            }
                        }
                    }
                    .edgesIgnoringSafeArea(.all)
                
                VStack (alignment: .trailing) {
                    //location button
                    LocationButton(.currentLocation) {
                        if let currentLocation = viewModel.currentLocation {
                            region = MKCoordinateRegion(
                                center: CLLocationCoordinate2D(latitude: currentLocation.coordinate.latitude, longitude: currentLocation.coordinate.longitude),
                                latitudinalMeters: 750,
                                longitudinalMeters: 750
                            )
                        }
                    }
                    .foregroundColor(.white)
                    .cornerRadius(6)
                    .labelStyle(.iconOnly)
                    .symbolVariant(.fill)
                    .tint(.black)
                    .padding(.bottom, 50)
                    
                    Spacer()
                    
//                    //searchbar
//                    HStack(spacing: 20) {
//                        Image(systemName: "magnifyingglass")
//                            .resizable()
//                            .frame(width: 20, height: 20)
//                            .padding(.leading)
//                            .foregroundColor(Color("PO-500"))
//                        TextField("Where do you want to go?", text: $destination)
//                            .accentColor(Color(UIColor.systemGray))
//                            .onChange(of: destination) {newValue in
//                                searchresultopen = (newValue != "")
//                            }
//
//                    }
//                    .frame(width: 358, height: 50).background(RoundedRectangle(cornerRadius: 10).foregroundColor(.white))
                    
                    if searchresultopen {
                        // list searchbar
//                        ScrollView {
//                            VStack(alignment: .leading, spacing: 0) {
//                                // list of filtered
//                                ForEach(searchResults) { place in
//                                    VStack(alignment: .leading, spacing: -0) {
//                                        VStack(alignment: .leading, spacing: 1) {
//                                            HStack {
//                                                NavigationLink(destination: SuggestedPage(destination: place.destinationPoint, placeholder1: place.currentPoint, placeholder2: place.namaRute, placeholder3: place.namaRute,rootIsActive: $isActive, data: place), isActive: self.$isActive){
//                                                    Text(place.destinationPoint)
//                                                        .font(.system(size: 14))
//                                                }
//                                                Spacer()
//                                                Image(systemName: "chevron.right")
//                                                    .padding(.horizontal)
//                                                    .font(.system(size: 14))
//                                                    .foregroundColor(Color(UIColor.systemGray))
//                                            }
//                                            .padding(.leading, 16)
//                                            .padding(.vertical, 16)
//                                            .foregroundColor(.black)
//                                            .onTapGesture {
//                                                print("clicked")
//                                            }
//                                            .background(RoundedRectangle(cornerRadius: 6)
//                                                .foregroundColor(.white))
//                                            Spacer()
//                                                .frame(height: 0)
//                                        }
//                                        .frame(alignment: .leading)
//                                        .transition(.opacity)
//                                    }
//                                }
//                                .frame(width: 358)
//
//                            }
//                        }
//                        .frame(height: 200)
//                        Spacer()
                    }
                }
            }
            .navigationBarBackButtonHidden(true)
            .onAppear {
                viewModel.requestAuthorization()
            }
        }
    }
}

struct ShowMapView_Previews: PreviewProvider {
    static var previews: some View {
        ShowMapView()
    }
}
