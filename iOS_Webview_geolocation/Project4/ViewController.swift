//
//  ViewController.swift
//  wkwebview
//
//  Created by Afrar Malakooth on 6/5/20.
//

import UIKit
import WebKit
import CoreLocation
import CoreMotion

class ViewController: UIViewController, CLLocationManagerDelegate, WKUIDelegate, WKNavigationDelegate {
    var webView: WKWebView!
    var locationManager: CLLocationManager?
    var motionManager: CMMotionManager?
    
    override func loadView() {
        webView = WKWebView()
        webView.navigationDelegate = self
        view = webView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        webView.uiDelegate = self

        locationManager = CLLocationManager()
        locationManager?.delegate = self
        locationManager?.requestAlwaysAuthorization()
        
        
        motionManager = CMMotionManager()
        
        motionManager?.startDeviceMotionUpdates()
        motionManager?.startAccelerometerUpdates()
        motionManager?.startGyroUpdates()
        motionManager?.startMagnetometerUpdates()
        
        
        //let url = Bundle.main.url(forResource: "index", withExtension: "html", subdirectory: "htmlFile")!

        //webView.loadFileURL(url, allowingReadAccessTo: url)
        //let request = URLRequest(url: url)
        //webView.load(request)
        
        let url = URL(string: "https://ianmills.ie/ARJS/examples/click-places/index.html")!
        
        webView.load(URLRequest(url: url))

        //webView.allowsBackForwardNavigationGestures = true
        
    }


}
