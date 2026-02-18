//
//  Favorites.swift
//  Ghibli App
//
//  Created by Kiran Raju Satihal on 08/02/26.
//

import SwiftUI

struct Favorites: View {
    @StateObject var viewModel = GhibiliViewModel()
    @EnvironmentObject var movie: FavoritesModel
    @StateObject private var vm = MoviesViewModel()
    
    var body: some View {
        NavigationStack{
            VStack{
                List {
                    ForEach(viewModel.filteredMovies.filter { movie.favorites.contains($0.title) }) { film in
                        MovieCell(movies: film)
                            .onTapGesture{
                                vm.selectedMovie = film
                            }
                    }
                }
                
                
            }
            .navigationTitle(Text("❤️  Favorites"))
            .navigationDestination(isPresented: $vm.isShowingDetailView) {
                DetailView(isShowingDetailView: $vm.isShowingDetailView, movies: vm.selectedMovie ?? Film.sampleFilm)
            }
            .task {
                await viewModel.fetchGhibliData()
            }
        }
    }
}

#Preview {
    Favorites()
        .environmentObject(FavoritesModel())
}
