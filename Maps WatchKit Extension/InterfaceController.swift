//
//  InterfaceController.swift
//  Maps WatchKit Extension
//
//  Created by appcamp on 26/07/15.
//  Copyright (c) 2015 appcamp. All rights reserved.
//

import WatchKit
import Foundation


class InterfaceController: WKInterfaceController {

    @IBOutlet weak var map: WKInterfaceMap!
    
    var span = MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1)
    

    

    
    override func awakeWithContext(context: AnyObject?) {
        super.awakeWithContext(context)
        
            let location = CLLocationCoordinate2D(latitude: 54.4, longitude: 18.5)
            let region = MKCoordinateRegion(center: location, span: span)
        map.setRegion(region)
        
        map.addAnnotation(location, withPinColor: WKInterfaceMapPinColor.Green)
    }
    
    /*
    func zoom(value: Float) {
        let degrees: CLLocationDegrees(10-value)/10
        let span = MKCoordinateSpanMake(degrees, degrees)
        let region = MKCoordinateRegion(center: location, span: span)
        map.setRegion(region)
    }
*/

    @IBAction func zoomIn() {
        if(span.latitudeDelta>0.1) {
            span.latitudeDelta -= 0.1
        }
        if(span.longitudeDelta>0.1) {
            span.longitudeDelta -= 0.1
        }
         let location = CLLocationCoordinate2D(latitude: 54.4, longitude: 18.5)
        
        let region = MKCoordinateRegion(center: location, span: span)
        map.setRegion(region)
        
        map.addAnnotation(location, withPinColor: WKInterfaceMapPinColor.Green)
    }
    
    @IBAction func zoomOut() {
        
        span.latitudeDelta += 0.1
        span.longitudeDelta += 0.1
        
        let location = CLLocationCoordinate2D(latitude: 54.4, longitude: 18.5)
        
        let region = MKCoordinateRegion(center: location, span: span)
        
        map.setRegion(region)
        
        map.addAnnotation(location, withPinColor: WKInterfaceMapPinColor.Green)
    
    }
    
    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
    }

    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }

}
