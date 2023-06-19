//
//  MapView.swift
//  SolfaCoustomer
//
//  Created by 3bood on 01/12/1444 AH.
//

import SwiftUI
import CoreLocation
import MapKit

struct MapView: View {
    @State private var Group = false
    @State private var Group1 = false
    @State private var Group2 = false
    @State private var region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 51.507222, longitude: -0.1275), span: MKCoordinateSpan(latitudeDelta: 0.5, longitudeDelta: 0.5))
    var body: some View {
        VStack {
            VStack() {
                Image("supermarket")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .aspectRatio( contentMode: .fit)
                Map(coordinateRegion: $region, showsUserLocation: true, userTrackingMode: .constant(.follow))
                    .frame(width: 385, height: 200)
                    .cornerRadius(10)
                
                VStack(alignment: .leading) {
                    Text("Super Market")
                    Text("""
                   This Supper Market Location IN London
                   And This Supper Is Buy More Stuf In
                   Every Thing
                   """)
                    
                   
                }.padding(.trailing,60)
                LabeledContent {
                    Text("London")
                }label: {
                    Image(systemName: "mappin.square.fill")
                }.padding()
                
                LabeledContent {
                    Text("27KM")
                }label: {
                    Image(systemName: "figure.outdoor.cycle")
                   
                }.padding()
                LabeledContent {
                    Text("24-hour")
                }label: {
                    Image(systemName: "door.right.hand.open")
                   
                }.padding()
     
                Spacer()
            }
            .ignoresSafeArea()
        }
        //.padding()
    }
}

struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView()
    }
}
