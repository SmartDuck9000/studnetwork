//
//  User.swift
//  studnetwork
//
//  Created by Георгий Куликов on 18.08.2020.
//  Copyright © 2020 Георгий Куликов. All rights reserved.
//

import Foundation

public struct User: Codable {
    var vkId: String
    var token: String
    
    var firstName: String
    var lastName: String
    
    var sex: Int?
    var city: String?
    var country: String?
    var homeTown: String?
    
    var avatarPhotoURL: String?
    var status: String?
    var occupation: String?
    
    var birthDate: String?
    var books: String?
    var games: String?
    var movies: String?
    var music: String?
    var interests: String?
    var personal: Personal?
    var relation: Int?
    var photos: [String]?
    var aboutSelf: String?
    
    var career: [String]?
    var educationForm: String?
    var educationStatus: String?
    var facultyName: String?
    var military: [String]?
    var universities: [University]?
    
    enum CodingKeys: String, CodingKey {
        case vkId = "vk_id"
        case token
        case firstName = "first_name"
        case lastName = "last_name"
        
        case sex
        case city
        case country
        case homeTown = "home_town"
        
        case avatarPhotoURL = "avatar_photo"
        case status
        case occupation
        case birthDate = "bdate"
        
        case books
        case games
        case movies
        case music
        case interests
        case personal
        case relation
        case photos
        case aboutSelf = "about_self"
        
        case career
        case educationForm = "education_form"
        case educationStatus = "education_status"
        case facultyName = "faculty_name"
        case military
        case universities
    }
}

public struct Personal: Codable {
    var alcohol: Int?
    var inspiredBy: String?
    var lifeMain: Int?
    var peopleMain: Int?
    var political: Int?
    var smoking: Int?
    
    enum CodingKeys: String, CodingKey {
        case alcohol
        case inspiredBy = "inspired_by"
        case lifeMain = "life_main"
        case peopleMain = "people_main"
        case political
        case smoking
    }
}

public struct University: Codable {
    var name: String?
    var facultyName: String?
    var chairName: String?
    
    enum CodingKeys: String, CodingKey {
        case name
        case facultyName = "faculty_name"
        case chairName = "chair_name"
    }
}
