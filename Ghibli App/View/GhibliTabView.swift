//
//  ContentView.swift
//  Ghibli App
//
//  Created by Kiran Raju Satihal on 07/02/26.
//

import SwiftUI
import Foundation

struct GhibliTabView: View {
    @EnvironmentObject var movie: FavoritesModel
    @EnvironmentObject var settings: SystemSettings
    @AppStorage("ColorScheme") private var ColorScheme = false
    
    
    
    
    var body: some View {
        TabView {
            
            MovieList()
                .tabItem{
                    Label("Movies", systemImage: "movieclapper")
                }
            
            Favorites()
                .tabItem{
                    Label("Favorites", systemImage: "heart")
                }
            
            Settings()
                .tabItem{
                    Label("Settings", systemImage: "gear")
                }
        }
        .tabBarMinimizeBehavior(.onScrollDown)
        .preferredColorScheme(ColorScheme ? .dark : .light)
        .tint(Color.purple.opacity(0.8))
        
        
    }
    
}

#Preview {
    GhibliTabView()
        .environmentObject(FavoritesModel())
        
        
}
