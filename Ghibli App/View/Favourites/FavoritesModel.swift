//
//  FavoritesModel.swift
//  Ghibli App
//
//  Created by Kiran Raju Satihal on 08/02/26.
//
import SwiftUI
import Combine

final class FavoritesModel: ObservableObject {
    @Published var favorites: [String] = [] // store titles

    func isFavorite(_ movie: FilmProperties) -> Bool {
        favorites.contains(where: { $0 == movie.title })
    }

    func toggleFavorite(_ movie: FilmProperties) {
        if let index = favorites.firstIndex(of: movie.title) {
            favorites.remove(at: index)
        } else {
            favorites.append(movie.title)
        }
    }
    
//    func favorites(from all: [FilmProperties]) -> [FilmProperties] {
//        all.filter { favoriteIDs.contains($0.id) }
//    }


}
