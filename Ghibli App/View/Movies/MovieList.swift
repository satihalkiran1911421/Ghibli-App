//
//  MovieList.swift
//  Ghibli App
//
//  Created by Kiran Raju Satihal on 08/02/26.
//

import SwiftUI

struct MovieList: View {
    @StateObject private var viewModel = GhibiliViewModel()
    @StateObject private var vm = MoviesViewModel()
    var body: some View {
        
        NavigationStack{
            List(viewModel.filteredMovies) { film in
                MovieCell(movies: film)
                    .onTapGesture{
                        vm.selectedMovie = film
                    }
            }
            .navigationTitle(Text("Ghibli Movies"))
            .searchable(text: $viewModel.searchTerm, placement: .navigationBarDrawer(displayMode: .automatic), prompt: "search movie")
            .navigationDestination(isPresented: $vm.isShowingDetailView) {
                DetailView(isShowingDetailView: $vm.isShowingDetailView, movies: vm.selectedMovie ?? Film.sampleFilm)
            }
            .task {
                await viewModel.fetchGhibliData()
            }
            .alert(item: $viewModel.alert) { alert in
                Alert(
                    title: alert.title,
                    message: alert.message,
                    dismissButton: alert.dismissButton
                )
            }
            if viewModel.isLoading {
                LoadingView()
            }
            
            
        }
        
    }
}

#Preview {
    MovieList()
        .environmentObject(FavoritesModel())
}
