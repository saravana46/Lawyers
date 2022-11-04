//
//  LawyersEntity.swift
//  Lawyers
//
//  Created by Saravana on 02/11/22.
//

import Foundation
import ObjectMapper

struct LoginEntity : Mappable {
    var message : String?
    var access_token : String?
    var user_id : Int?
    var name : String?
    var token_type : String?
    var uuid : String?
    var expires_in : Int?
    var referal_status : String?

    init?(map: Map) {

    }

    mutating func mapping(map: Map) {

        message <- map["message"]
        access_token <- map["access_token"]
        user_id <- map["user_id"]
        name <- map["name"]
        token_type <- map["token_type"]
        uuid <- map["uuid"]
        expires_in <- map["expires_in"]
        referal_status <- map["referal_status"]
    }

}

struct LawyersEntity : Mappable {
    var message : String?
    var code : Int?
    var data : [Data]?
    var pages : Int?

    init?(map: Map) {

    }

    mutating func mapping(map: Map) {

        message <- map["message"]
        code <- map["code"]
        data <- map["data"]
        pages <- map["pages"]
    }

}

struct Data : Mappable {
    var id : Int?
    var uuid : String?
    var name : String?
    var address : String?
    var state : String?
    var field_of_expertise : String?
    var bio : String?
    var level : String?
    var hours_logged : String?
    var phone_no : String?
    var email : String?
    var areas_of_practise : [String]?
    var service_offered : [String]?
    var profile_picture : String?
    var rating : String?
    var ranking : String?

    init?(map: Map) {

    }

    mutating func mapping(map: Map) {

        id <- map["id"]
        uuid <- map["uuid"]
        name <- map["name"]
        address <- map["address"]
        state <- map["state"]
        field_of_expertise <- map["field_of_expertise"]
        bio <- map["bio"]
        level <- map["level"]
        hours_logged <- map["hours_logged"]
        phone_no <- map["phone_no"]
        email <- map["email"]
        areas_of_practise <- map["areas_of_practise"]
        service_offered <- map["service_offered"]
        profile_picture <- map["profile_picture"]
        rating <- map["rating"]
        ranking <- map["ranking"]
    }

}
