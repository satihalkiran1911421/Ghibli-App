//
//  FavoritesViewModel.swift
//  Ghibli App
//
//  Created by Kiran Raju Satihal on 08/02/26.
//

import Foundation
import Combine

final class MoviesViewModel: ObservableObject {

    var selectedMovie: FilmProperties?{
        didSet{
            isShowingDetailView = true
        }
    }
    @Published var isShowingDetailView: Bool = false
}
