//
//  User+CoreDataClass.swift
//  studnetwork
//
//  Created by Георгий Куликов on 26.08.2020.
//  Copyright © 2020 Георгий Куликов. All rights reserved.
//
//

import Foundation
import CoreData

extension CodingUserInfoKey {
    static let context = CodingUserInfoKey(rawValue: "context")
}

@objc(User)
public class User: NSManagedObject, Codable {
    
    required convenience public init(from decoder: Decoder) throws {
        guard let codingContext = CodingUserInfoKey.context else { fatalError("Failed to decode user") }
        guard let context = decoder.userInfo[codingContext] as? NSManagedObjectContext else { fatalError("Failed to decode user") }
        guard let entity = NSEntityDescription.entity(forEntityName: "User", in: context) else { fatalError("Failed to decode user") }

        self.init(entity: entity, insertInto: context)
        guard let container = try? decoder.container(keyedBy: CodingKeys.self) else { fatalError("Failed to decode user") }
        
        do {
            aboutSelf = try container.decode(String.self, forKey: .aboutSelf)
            avatatrUrl = try container.decode(String.self, forKey: .avatatrUrl)
            birthDate = try container.decode(String.self, forKey: .birthDate)
            books = try container.decode(String.self, forKey: .books)
            city = try container.decode(String.self, forKey: .city)
            firstName = try container.decode(String.self, forKey: .firstName)
            games = try container.decode(String.self, forKey: .games)
            hometown = try container.decode(String.self, forKey: .hometown)
            interests = try container.decode(String.self, forKey: .interests)
            lastName = try container.decode(String.self, forKey: .lastName)
            movies = try container.decode(String.self, forKey: .movies)
            music = try container.decode(String.self, forKey: .music)
            occupation = try container.decode(String.self, forKey: .occupation)
            photos = try container.decode([String].self, forKey: .photos)
            sex = try container.decode(String.self, forKey: .sex)
            status = try container.decode(String.self, forKey: .status)
            token = try container.decode(String.self, forKey: .token)
            vkId = try container.decode(String.self, forKey: .vkId)
        } catch {
            print(error.localizedDescription)
        }
    }
    
    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        
        do {
            try container.encode(aboutSelf ?? "", forKey: .aboutSelf)
            try container.encode(avatatrUrl ?? "", forKey: .avatatrUrl)
            try container.encode(birthDate ?? "", forKey: .birthDate)
            try container.encode(books ?? "", forKey: .books)
            try container.encode(city ?? "", forKey: .city)
            try container.encode(firstName ?? "", forKey: .firstName)
            try container.encode(games ?? "", forKey: .games)
            try container.encode(hometown ?? "", forKey: .hometown)
            try container.encode(interests ?? "", forKey: .interests)
            try container.encode(lastName ?? "", forKey: .lastName)
            try container.encode(movies ?? "", forKey: .movies)
            try container.encode(music ?? "", forKey: .music)
            try container.encode(occupation ?? "", forKey: .occupation)
            try container.encode(photos ?? [], forKey: .photos)
            try container.encode(sex, forKey: .sex)
            try container.encode(status ?? "", forKey: .status)
            try container.encode(token ?? "", forKey: .token)
            try container.encode(vkId ?? "", forKey: .vkId)
        } catch {
            print(error.localizedDescription)
        }
    }
    
    @NSManaged public var aboutSelf: String?
    @NSManaged public var avatatrUrl: String?
    @NSManaged public var birthDate: String?
    @NSManaged public var books: String?
    @NSManaged public var city: String?
    @NSManaged public var country: String?
    @NSManaged public var firstName: String?
    @NSManaged public var games: String?
    @NSManaged public var hometown: String?
    @NSManaged public var interests: String?
    @NSManaged public var lastName: String?
    @NSManaged public var movies: String?
    @NSManaged public var music: String?
    @NSManaged public var occupation: String?
    @NSManaged public var photos: [String]?
    @NSManaged public var sex: String?
    @NSManaged public var status: String?
    @NSManaged public var token: String?
    @NSManaged public var vkId: String?
    
    enum CodingKeys: String, CodingKey {
        case vkId = "vk_id"
        case token
        case firstName = "first_name"
        case lastName = "last_name"
        
        case sex
        case city
        case country
        case hometown = "home_town"
        
        case avatatrUrl = "avatar_photo"
        case status
        case occupation
        case birthDate = "bdate"
        
        case books
        case games
        case movies
        case music
        case interests
        case photos
        case aboutSelf = "about_self"
    }
}
