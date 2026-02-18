//
//  MovieCell.swift
//  Ghibli App
//
//  Created by Kiran Raju Satihal on 07/02/26.
//

import SwiftUI

struct MovieCell: View {
    @EnvironmentObject var movie: FavoritesModel
    let movies: FilmProperties
    @StateObject var viewModel = GhibiliViewModel()
    
    // Safely build the URL from the movie's image string
    private var imageURL: URL? {
        URL(string: movies.image)
    }
    
    var body: some View {
        HStack {
            AsyncImage(url: imageURL) { phase in
                switch phase {
                case .empty:
                    ZStack {
                        Rectangle().fill(Color.gray.opacity(0.2))
                        ProgressView()
                    }
                    .frame(width: 110, height: 150)
                    .cornerRadius(5)
                case .success(let image):
                    image
                        .resizable()
                        .scaledToFill()
                        .frame(width: 110, height: 150)
                        .clipped()
                        .cornerRadius(5)
                case .failure:
                    ZStack {
                        Rectangle().fill(Color.gray.opacity(0.2))
                        Image(systemName: "photo")
                            .imageScale(.large)
                            .foregroundStyle(.secondary)
                    }
                    .frame(width: 110, height: 150)
                    .cornerRadius(5)
                @unknown default:
                    EmptyView()
                }
            }
            
            VStack(alignment: .leading, spacing: 5) {
                HStack(spacing: 30) {
                    Text(movies.title)
                        .font(.system(size: 20, weight: .bold, design: .default))
                    
                    Spacer()
                    
                    Button {
                        movie.toggleFavorite(movies)
                    } label: {
                        Image(systemName: movie.isFavorite(movies) ? "heart.fill" : "heart")
                            .resizable()
                            .frame(width: 23, height: 23)
                            .foregroundStyle(movie.isFavorite(movies) ? .red : .secondary)
                    }
                    .buttonStyle(.plain)
                }
                
                Text(movies.director)
                    .font(.headline)
                    .foregroundColor(.secondary)
                Text("Released: \(movies.releaseYear)")
                    .font(.subheadline)
                    .foregroundColor(.secondary)
            }
            Spacer()
        }
        .padding()
        // Example: perform background work when the cell appears
        .onAppear {
            // If you need to do heavy work, run it off the main thread
            DispatchQueue.global(qos: .background).async {
                // ... heavy/background work here (e.g., parsing, caching, prefetching)
                
                // When updating UI state, hop back to the main actor
                DispatchQueue.main.async {
                    // e.g., update some @State / view model properties
                    // viewModel.didPrefetch = true
                }
            }
            
            // Or using Swift Concurrency:
            Task.detached {
                // ... background work
                
                await MainActor.run {
                    // update UI-related state safely on main actor
                }
            }
        }
    }
}

#Preview {
    MovieCell(movies: Film.sampleFilm)
        .environmentObject(FavoritesModel())
}
