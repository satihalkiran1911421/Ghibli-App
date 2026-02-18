//
//  Person.swift
//  Ghibli App
//
//  Created by Kiran Raju Satihal on 07/02/26.


import Foundation
import Playgrounds

struct Person: Codable, Identifiable {
    let id: String
    let name: String
    let gender: String
    let age: String
    let eyeColor: String
    let hairColor: String
    let films: [String]
    
    enum CodingKeys: String, CodingKey {
        case id, name, gender, age, films
        case eyeColor = "eye_color"
        case hairColor = "hair_color"
    }
    
    
}


