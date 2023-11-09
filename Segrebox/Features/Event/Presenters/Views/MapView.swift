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
    
    @Binding var region: MKCoordinateRegion
    
    func makeCoordinator() -> Coordinator {
        return MapView.Coordinator()
    }
    
    func makeUIView(context: Context) -> MKMapView {
        let view = mapData.mapView
        
        view.showsUserLocation = true
        view.delegate = context.coordinator
        
        view.setRegion(region, animated: true)
        
        return view
    }
    
    func updateUIView(_ uiView: MKMapView, context: Context) {
        
    }
    
    class Coordinator: NSObject, MKMapViewDelegate{
        
        let map = MKMapView()
     
        func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
            if annotation.isKind(of: MKUserLocation.self) { return nil }
            
            else {

                var pinAnnotation = map.dequeueReusableAnnotationView(withIdentifier: "custom")
                
                if pinAnnotation == nil {
                    pinAnnotation = MKAnnotationView(annotation: annotation, reuseIdentifier: "custom")
                    pinAnnotation?.canShowCallout = true
                } else {
                    pinAnnotation?.annotation = annotation
                }
                
                pinAnnotation?.image = UIImage(named: "TrashBin")
                
                
                return pinAnnotation
            }
        }
        
    }

}
