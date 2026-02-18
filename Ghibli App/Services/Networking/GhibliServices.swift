//
//  FetchingApi.swift
//  Ghibli App
//
//  Created by Kiran Raju Satihal on 07/02/26.
//

import Foundation
import UIKit

final class GhibliServices{
    let url = "https://ghibliapi.vercel.app/films"
    private let cache = NSCache<NSString, UIImage>()
    
    func fetchGhibliData() async throws -> [FilmProperties] {
        guard let url = URL(string: url) else{
            throw GhibliAPIError.invalidURL
        }
        
        let (data, response) = try await URLSession.shared.data(from: url)
        
        do{
            guard let httpResponse = response as? HTTPURLResponse else {
                throw GhibliAPIError.invalidResponse
            }
            
            guard httpResponse.statusCode == 200 else {
                throw GhibliAPIError.invalidStatusCode
            }
            
            let decoder = JSONDecoder()
            let films = try decoder.decode([FilmProperties].self, from: data)
            return films
            
        } catch {
            throw GhibliAPIError.jsonParsingFailure
        }
    }
    
    func fetchPerson(from urlString: String) async throws -> Person {
        guard let url = URL(string: urlString) else {
            throw GhibliAPIError.invalidURL
        }

        let (data, response) = try await URLSession.shared.data(from: url)

        guard let httpResponse = response as? HTTPURLResponse,
              httpResponse.statusCode == 200 else {
            throw GhibliAPIError.invalidResponse
        }

        return try JSONDecoder().decode(Person.self, from: data)
    }


    
    func downloadImage(fromURLString urlString: String) async throws -> UIImage {
        let cacheKey = urlString as NSString
        
        if let cachedImage = cache.object(forKey: cacheKey) {
            print("✅ Image from cache")
            return cachedImage
        }
        
        guard let url = URL(string: urlString) else {
            throw GhibliAPIError.invalidURL
        }
        
        let (data, response) = try await URLSession.shared.data(from: url)
                    
        guard let httpResponse = response as? HTTPURLResponse,
                httpResponse.statusCode == 200,
                let image = UIImage(data: data) else {
                throw GhibliAPIError.invalidResponse
        }
            
        cache.setObject(image, forKey: cacheKey)
        return image
    }
}

