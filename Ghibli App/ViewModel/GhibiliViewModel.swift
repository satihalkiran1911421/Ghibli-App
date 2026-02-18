//
//  GhibiliViewMode.swift
//  Ghibli App
//
//  Created by Kiran Raju Satihal on 07/02/26.
//

import Foundation
import Combine

@MainActor
final class GhibiliViewModel: ObservableObject {
    enum State{
        case idle
        case loading
        case loaded([FilmProperties])
    }
    
    var state: State = .idle
    @Published var films = [FilmProperties]()
    @Published var people: [Person] = []
    @Published var isLoading: Bool = false
    @Published var alert: Alerts?
    @Published var searchTerm: String = ""
    
    private let service = GhibliServices()
    
    var filteredMovies: [FilmProperties] {
        guard !searchTerm.isEmpty else { return films }
        return films.filter { film in
            film.title.localizedCaseInsensitiveContains(searchTerm)
        }
    }
    
    init() {
    }
    
    func fetchGhibliData() async {
        do {
            films = try await service.fetchGhibliData()
            self.state = .loaded(films)
        } catch let error as GhibliAPIError {
                    switch error {
                        case .invalidURL:
                            alert = AlertContext.invalidURL
                        case .noData:
                            alert = AlertContext.noData
                        case .invalidData:
                            alert = AlertContext.invalidData
                        case .invalidResponse:
                            alert = AlertContext.invalidResponse
                        case .invalidStatusCode:
                            alert = AlertContext.invalidStatuseCode
                        case .jsonParsingFailure:
                            alert = AlertContext.jsonParsingFailure
                        default:
                            alert = AlertContext.unkownError
                    }
        } catch {
            alert = AlertContext.unkownError
        }
    }
    
    func loadPeople(for film: FilmProperties) async {
        isLoading = true
        defer { isLoading = false }

        for personURL in film.people {
            do {
                let person = try await service.fetchPerson(from: personURL)
                people.append(person)
            } catch {
                print("❌ Failed to fetch person:", error)
            }
        }
    }


}
