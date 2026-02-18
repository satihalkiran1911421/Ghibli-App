//
//  Ghibli_AppApp.swift
//  Ghibli App
//
//  Created by Kiran Raju Satihal on 07/02/26.
//

import SwiftUI

@main
struct Ghibli_AppApp: App {
    @AppStorage("ColorScheme") private var ColorScheme = false
    var movie = FavoritesModel()
    var body: some Scene {
        WindowGroup {
            GhibliTabView()
                .environmentObject(movie)
                .preferredColorScheme(ColorScheme ? .dark : .light)
        }
    }
}
