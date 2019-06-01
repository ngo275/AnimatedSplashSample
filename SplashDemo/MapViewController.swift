//
//  MapViewController.swift
//  SplashDemo
//
//  Created by ShuichiNagao on 2019/06/01.
//  Copyright © 2019 Shuichi Nagao. All rights reserved.
//

import UIKit
import MapKit

private let FuberHeadquartersCoordinate = CLLocationCoordinate2D(latitude: 37.775447, longitude: -122.418222)

class MapViewController: UIViewController {
    
//    @IBOutlet weak var mapView: MKMapView!
//    @IBOutlet weak var slider: UISlider!
//    @IBOutlet weak var containerBarButtonItem: UIBarButtonItem!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let region = MKCoordinateRegion(center: FuberHeadquartersCoordinate, span: MKCoordinateSpan(latitudeDelta: 0.005, longitudeDelta: 0.005))
//        mapView.setRegion(region, animated: true)
//        containerBarButtonItem.width = view.bounds.width
        
    }
    
    
//    @IBAction func riderSelectionDidFinishDraggingInsideSlider(_ sender: UISlider) {
//        updateSlider(sender)
//    }
//
//    @IBAction func riderSelectionDidFinishDraggingOutside(_ sender: UISlider) {
//        updateSlider(sender)
//    }
    
    func updateSlider(_ slider: UISlider) {
        if slider.value >= 0.5 {
            slider.setValue(1.0, animated: true)
        } else {
            slider.setValue(0.0, animated: true)
        }
    }
    
    
}




