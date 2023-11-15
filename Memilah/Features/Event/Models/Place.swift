//
//  Place.swift
//  Memilah
//
//  Created by Randy Julian on 25/10/23.
//

import SwiftUI
import MapKit

struct Place: Identifiable {
    var id = UUID().uuidString
    var place: CLPlacemark
}
