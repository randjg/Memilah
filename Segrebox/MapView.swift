//
//  MapView.swift
//  Segrebox
//
//  Created by Randy Julian on 25/10/23.
//

import SwiftUI
import MapKit

struct MapView: UIViewRepresentable {
    
    @EnvironmentObject var mapData: MapViewModel
    
    func makeCoordinator() -> Coordinator {
        return MapView.Coordinator()
    }
    
    func makeUIView(context: Context) -> MKMapView {
        let view = mapData.mapView
        
        view.showsUserLocation = true
        view.delegate = context.coordinator
        
        return view
    }
    
    func updateUIView(_ uiView: MKMapView, context: Context) {
        
    }
    
    class Coordinator: NSObject, MKMapViewDelegate{
     
        func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
            if annotation.isKind(of: MKUserLocation.self) { return nil }
            
            else {
//                let pinAnnotation = MKMarkerAnnotationView(annotation: annotation, reuseIdentifier: "pinImage")
//                pinAnnotation.canShowCallout = true
//                pinAnnotation.image = UIImage(named: "trashbin")
//                pinAnnotation.calloutOffset = CGPointMake(0, 32)
                
                var pinAnnotation = map.dequeueReusableAnnotationView(withIdentifier: "custom")
                
                
                return pinAnnotation
            }
//            guard !(annotation is MKUserLocation) else {
//                return nil
//            }
//            
//            var annotationView = MKMapView.dequeueReusableAnnotationView(withIdentifier: "custom")
//            
//            if annotationView == nil {
//                annotationView = MKAnnotationView(annotation: annotation, reuseIdentifier: "custom")
//                annotationView?.canShowCallout = true
//            } else {
//                annotationView?.annotation = annotation
//            }
//            
//            annotationView?.image = UIImage(named: "trashbin")
        }
        
    }

}

#Preview {
    MapView()
}
