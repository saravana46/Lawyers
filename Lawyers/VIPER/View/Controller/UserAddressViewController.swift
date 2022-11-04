//
//  UserAddressViewController.swift
//  Lawyers
//
//  Created by Saravana on 03/11/22.
//

import UIKit
import GooglePlaces
import CoreLocation
import GoogleMaps

class UserAddressViewController: UIViewController {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var mapView: GMSMapView!
    @IBOutlet weak var addressTextField: UITextField!
    

    let manager = CLLocationManager()
    let startMarker = GMSMarker()
    var latitude = 0.0
    var longitude = 0.0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initialLoads()
        manager.delegate = self
        mapView.delegate = self
        self.manager.requestWhenInUseAuthorization()
        self.manager.requestAlwaysAuthorization()
        self.manager.startUpdatingLocation()
        self.manager.allowsBackgroundLocationUpdates = true
        if CLLocationManager.locationServicesEnabled() {
            self.manager.delegate = self
            self.manager.desiredAccuracy = kCLLocationAccuracyBest
            self.manager.startUpdatingLocation()
        }
        startMarker.map = mapView
        self.navigationController?.isNavigationBarHidden = true
    }
    
    @IBAction func addressSearch(_ sender: Any) {
        let acController = GMSAutocompleteViewController()
        acController.delegate = self
        present(acController, animated: true, completion: nil)
    }
    
}

extension UserAddressViewController{
    
    func initialLoads(){
        titleLabel.text = "MapLocation"
        addressTextField.attributedPlaceholder = NSAttributedString(string: "Type Address...", attributes: [NSAttributedString.Key.foregroundColor : UIColor.gray, .font: UIFont.systemFont(ofSize: 15)])
        let AddressFieldView = UIView(frame: CGRect(x:0, y:0, width:10, height:self.addressTextField.frame.height))
        addressTextField.leftView = AddressFieldView
        addressTextField.leftViewMode = UITextField.ViewMode.always
    }
    
    private func reverseGeocodeCoordinate(_ coordinate: CLLocationCoordinate2D) {
        
        let geocoder = GMSGeocoder()
        
        geocoder.reverseGeocodeCoordinate(coordinate) { response, error in
            guard let address = response?.firstResult(), let lines = address.lines else {
                return
            }
            UIView.animate(withDuration: 0.25) {
                self.view.layoutIfNeeded()
            }
        }
    }
    
}

// MARK: - GMSAutocompleteViewControllerDelegate

extension UserAddressViewController: GMSAutocompleteViewControllerDelegate {
    
    // Handle the user's selection.
    func viewController(_ viewController: GMSAutocompleteViewController, didAutocompleteWith place: GMSPlace) {
        print("Place name: \(place.name ?? "")")
        print("Place place.coordinate.latitude: \(place.coordinate.latitude)")
        print("Place attributions: \(place.coordinate.longitude)")
        dismiss(animated: true, completion: nil)
        addressTextField.text = place.name ?? ""
        latitude = place.coordinate.latitude
        longitude = place.coordinate.longitude
        
    }
    
    func viewController(_ viewController: GMSAutocompleteViewController, didFailAutocompleteWithError error: Error) {
        // TODO: handle the error.
        print("Error: \(error)")
        dismiss(animated: true, completion: nil)
    }
    
    // User cancelled the operation.
    func wasCancelled(_ viewController: GMSAutocompleteViewController) {
        print("Autocomplete was cancelled.")
        dismiss(animated: true, completion: nil)
    }
}

// MARK: - CLLocationManagerDelegate

extension UserAddressViewController: CLLocationManagerDelegate {
    
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        
        guard status == .authorizedWhenInUse else {
            return
        }
        
        manager.startUpdatingLocation()
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        
        startMarker.position = CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
        
        let favCoordinatesArray: CLLocationCoordinate2D  = CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
        
        mapView.camera = GMSCameraPosition(target: favCoordinatesArray, zoom: 15, bearing: 0, viewingAngle: 0)
        
        DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(5), execute: {
            self.manager.requestAlwaysAuthorization()
            self.manager.startUpdatingLocation()
        })

    }
    
}

// MARK: - GMSMapViewDelegate
extension UserAddressViewController: GMSMapViewDelegate {
    func mapView(_ mapView: GMSMapView, idleAt position: GMSCameraPosition) {
        reverseGeocodeCoordinate(position.target)
    }
}
