//
//  AppManager.swift
//  Lawyers
//
//  Created by Saravana on 03/11/22.
//

import Foundation

class AppManager {
    
    static var shared = AppManager()
    
    public var accessToken: String?
    
}

struct APPConstant {
    static let API_KEY = "AIzaSyDScZ3EPKYuCveMD2bKUvP78XVjwhDmxuc"
    static let url = "http://80.211.233.121/blacklight/blacklight/public/api/lawyers/index"
    static let LoginURL = "http://80.211.233.121/blacklight/blacklight/public/api/auth/login"
}
