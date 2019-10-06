//
//  MapView.swift
//  Chapter1
//
//  Created by ParkHyunsoo on 2019/10/05.
//  Copyright © 2019 ParkHyunsoo. All rights reserved.
//

import SwiftUI

import MapKit

/*
 To use UIView subclasses from within swiftUI, you wrap the other view in a SwiftUI view that conforms to the 'UIViewRepresentable' or 'NSViewRepresentable' protocol
 
 [NSViewRepresentable]
 - associated types
    - Coordinator
    - NSViewType
 
 - initialization phase
    - makeCoordinate()                  : (required) 코디네이터 인스턴스 생성, default implementation 포함
    - makeNSView(content:)              : (required) 뷰 인스턴스 생성
    - updateNSView(_: context:)         : (required) 뷰와 코디네이터 마지막 configuration따라 업데이트
 
 - update phase
    - updateNSView(_:context:)
 
 - deinitialization phase
    - dismantleNSView(_:coordinator:)   : (required) clean up presented view and coordinator, default implementation 포함
 */

struct MapView: NSViewRepresentable {
    
    var coordinate: CLLocationCoordinate2D
    
    func makeNSView(context: Context) -> MKMapView {
        MKMapView(frame: .zero)
    }
    
    func updateNSView(_ nsView: MKMapView, context: Context) {
        let span = MKCoordinateSpan(latitudeDelta: 0.02, longitudeDelta: 0.02)
        let region = MKCoordinateRegion(center: coordinate, span: span)
        nsView.setRegion(region, animated: true)
    }
}

struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView(coordinate: landmarkData[0].locationCoordinate)
    }
}
