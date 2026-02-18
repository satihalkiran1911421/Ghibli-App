//
//  Film.swift
//  Ghibli App
//
//  Created by Kiran Raju Satihal on 07/02/26.
//

import Foundation

struct FilmProperties: Codable, Identifiable{
    let id: String
    let title: String
    let originalTitle: String
    let originalTitleRomanised: String
    let description: String
    let director: String
    let producer: String
    
    let releaseYear: String
    let score: String
    let duration: String
    
    let image: String
    let bannerImage: String
    
    let people: [String]
    let url: String
    
    enum CodingKeys: String, CodingKey {
        case id, title, description, director, producer, image, people, url
        case releaseYear = "release_date"
        case score = "rt_score"
        case duration = "running_time"
        case bannerImage = "movie_banner"
        case originalTitle = "original_title"
        case originalTitleRomanised = "original_title_romanised"
    }
}

struct Film{
    static let sampleFilm = FilmProperties(id: "1",
                                    title: "Spirited Away",
                                    originalTitle: "天空の城ラピュタ",
                                    originalTitleRomanised: "Tenkū no shiro Rapyuta",
                                    description: "A young girl wanders into a world inhabited by spirits, where she can befriend them and learn about the true nature of love and friendship.",
                                    director: "Hayao Miyazaki",
                                    producer: "Isao Takahata",
                                    
                                    releaseYear: "2001",
                                    score: "98",
                                    duration: "125",
                                    image: "https://image.tmdb.org/t/p/w600_and_h900_bestv2/npOnzAbLh6VOIu3naU5QaEcTepo.jpg",
                                    bannerImage: "https://image.tmdb.org/t/p/w533_and_h300_bestv2/3cyjYtLWCBE1uvWINHFsFnE8LUK.jpg",
                                    people: [
                                        "https://ghibliapi.vercel.app/people/598f7048-74ff-41e0-92ef-87dc1ad980a9",
                                        "https://ghibliapi.vercel.app/people/fe93adf2-2f3a-4ec4-9f68-5422f1b87c01",
                                        "https://ghibliapi.vercel.app/people/3bc0b41e-3569-4d20-ae73-2da329bf0786",
                                        "https://ghibliapi.vercel.app/people/40c005ce-3725-4f15-8409-3e1b1b14b583",
                                        "https://ghibliapi.vercel.app/people/5c83c12a-62d5-4e92-8672-33ac76ae1fa0",
                                        "https://ghibliapi.vercel.app/people/e08880d0-6938-44f3-b179-81947e7873fc",
                                        "https://ghibliapi.vercel.app/people/2a1dad70-802a-459d-8cc2-4ebd8821248b"
                                      ],
                                    url: "https://ghibliapi.vercel.app/films/2baf70d1-42bb-4437-b551-e5fed5a87abe"
)
}


