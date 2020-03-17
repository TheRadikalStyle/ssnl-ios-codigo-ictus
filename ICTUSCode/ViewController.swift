//
//  ViewController.swift
//  ICTUSCode
//
//  Created by David Ochoa on 7/2/18.
//  Copyright © 2018 Secretaria de Salud Nuevo Leon. All rights reserved.
//

import UIKit
import GoogleMaps

class ViewController: UIViewController, CLLocationManagerDelegate, UITabBarDelegate {
    let mtyLatitud = 25.668963
    let mtyLongitud = -100.311247
    let mapZoom :Float = 12.0
    let mapMinZoom :Float = 8.0;
    let mapMaxZoom :Float = 17.0;
    
    //var mapView :GMSMapView?
    var isReadyToNavigate = false
    var locationManager :CLLocationManager? = nil
    var currentLocationLatitude :String = ""
    var currentLocationLongitude :String = ""
    var destinyLocationLatitude :String = ""
    var destinyLocationLongitude :String = ""
    var isProcessAlreadyTaken = false
    
    @IBOutlet weak var viewMap: UIView!
    @IBOutlet weak var mapView: GMSMapView!
    @IBOutlet weak var bottomTamBar: UITabBar!
    @IBOutlet weak var tabBarItemMAsInfo: UITabBarItem!
    @IBOutlet weak var tabBarItemMisDatos: UITabBarItem!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        SetLocationListener()
        bottomTamBar.tintColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        if #available(iOS 10.0, *) {
            bottomTamBar.unselectedItemTintColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        }
        bottomTamBar.delegate = self
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func SetLocationListener(){
        locationManager = CLLocationManager()
        // Ask for Authorization from the User.
        self.locationManager?.requestAlwaysAuthorization()
        // For use in foreground
        self.locationManager?.requestWhenInUseAuthorization()
        if CLLocationManager.locationServicesEnabled() {
            locationManager?.delegate = self as? CLLocationManagerDelegate
            locationManager?.desiredAccuracy = kCLLocationAccuracyNearestTenMeters
            locationManager?.startUpdatingLocation()
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let locValue: CLLocationCoordinate2D = manager.location?.coordinate else { return }
        currentLocationLatitude = String(locValue.latitude)
        currentLocationLongitude = String(locValue.longitude)
        print(currentLocationLatitude)
        print(currentLocationLongitude)
        
        if(!isProcessAlreadyTaken){
            //FillArray()
            setGoogleMap()
            isProcessAlreadyTaken = true
        }
    }

    func setGoogleMap() {
        // Create a GMSCameraPosition that tells the map to display the
        let camera = GMSCameraPosition.camera(withLatitude: mtyLatitud, longitude: mtyLongitud, zoom: mapZoom)
        mapView.isMyLocationEnabled = true
        mapView.moveCamera(GMSCameraUpdate.setCamera(camera))
        mapView.setMinZoom(mapMinZoom, maxZoom: mapMaxZoom)
        mapView = viewMap as! GMSMapView?
        //Once the map is loaded, set markers from array
        //SetMarkersArrayFilled(type: 0)
    }
    
    func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem) {
        switch item.tag {
        case 1:
            //Item selected is Mas informacion
            let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
            let newViewController = storyBoard.instantiateViewController(withIdentifier: "masInfoViewController") as! MasInfoViewController
            //self.present(newViewController, animated: true, completion: nil)
            self.navigationController?.pushViewController(newViewController, animated: true)
        
        case 2:
            //Item selected is Mis Datos
            let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
            let newViewController = storyBoard.instantiateViewController(withIdentifier: "misDatosViewController") as! CustomPageViewController
            //self.present(newViewController, animated: true, completion: nil)
            self.navigationController?.pushViewController(newViewController, animated: true)
            
        default:
            print("Error de inicialización")
        }
    }
}

