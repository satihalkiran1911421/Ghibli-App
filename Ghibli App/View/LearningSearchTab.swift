//
//  SearchMovie.swift
//  Ghibli App
//
//  Created by Kiran Raju Satihal on 09/02/26.
//

import SwiftUI

struct LearningSearchTab: View {
    @EnvironmentObject var movie: FavoritesModel
    @EnvironmentObject var settings: SystemSettings
    @State private var searchText: String = ""
    var body: some View {
        TabView {
            
            Tab("Movies", systemImage: "movieclapper"){
                MovieList()
            }
            Tab("Favorites", systemImage: "heart"){
                Favorites()
            }
            
            Tab("Settings", systemImage: "gear"){
                Settings()
            }
            Tab(role: .search){
                MovieList()
            }
        }
        .tabBarMinimizeBehavior(.onScrollDown)
        .tint(Color.purple.opacity(0.8))
        
        
    }
}

#Preview {
    LearningSearchTab()
        .environmentObject(FavoritesModel())
}
