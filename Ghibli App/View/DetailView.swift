//
//  DetailView.swift
//  Ghibli App
//
//  Created by Kiran Raju Satihal on 08/02/26.
//

import SwiftUI

struct DetailView: View {
    @Binding var isShowingDetailView: Bool
    @StateObject var viewModel = GhibiliViewModel()
    var movies: FilmProperties
    @EnvironmentObject var movie: FavoritesModel
    var body: some View {
        ScrollView{
            VStack(alignment: .leading){
                AppetizerRemoteImage(urlString: movies.bannerImage)
                    .frame(width: 401, height: 300)
                    .scaledToFit()
                    .shadow(radius: 10)
                
                VStack(alignment: .leading){
                    Text(movies.title)
                        .font(.system(size: 33, weight: .bold))
                        .font(.headline)
                                                
                    Text("\(movies.originalTitle) \(movies.originalTitleRomanised)")
                        .foregroundColor(.secondary)
                        .padding(.bottom, 10)
                    
                   
                    
                    characters(character: "Director", characterName: movies.director)
                    characters(character: "Producer", characterName: movies.producer)
                    characters(character: "Release Date", characterName: movies.releaseYear)
                    characters(character: "Running Time", characterName: "\(movies.duration) minutes")
                    characters(character: "Score", characterName: "\(movies.score)/100")
                    
                    Divider()
                        .padding(.top, 30)
                    
                    Text("Description")
                        .font(Font.system(size: 25, weight: .bold))
                        .padding(.top, 20)
                        .padding(10)
                    
                    Text(movies.description)
                        .font(.system(size: 18, weight: .semibold))
                        .padding(.leading, 10)
                        .padding(.bottom, 10)
                    
                    VStack{
                        Text("Characters")
                            .font(Font.system(size: 25, weight: .bold))
                            .padding(.top, 20)
                            .padding(.bottom, 10)
                        ForEach(viewModel.people) { character in
                            CharacterDetails(characterName: character.name, gender: character.gender, age: character.age, eyeColor: character.eyeColor, hairColor: character.hairColor)
                        }
                        
                    }
                    .frame(maxWidth: .infinity)
                    .background(
                        RoundedRectangle(cornerRadius: 12)
                            .fill(Color(.secondarySystemBackground))
                    )
                    
                    

                    Spacer()

                }
                .padding(.leading, 10)
                .padding(.trailing, 10)
            }
            
        }
        .task {
            await viewModel.loadPeople(for: movies)
        }
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            ToolbarItem(placement: .principal) {
                Text(movies.title)
                    .font(.system(size: 23, weight: .bold))
                    .fontWeight(.semibold)
            }
            ToolbarItem(placement: .navigationBarTrailing) {
                Button{
                    movie.toggleFavorite(movies)
                } label:{
                    Image(systemName: movie.isFavorite(movies) ? "heart.fill" : "heart")
                        .foregroundStyle(movie.isFavorite(movies) ? .red : .secondary)
                }
                
            }
        }
            
    }
}

#Preview {
    DetailView(isShowingDetailView: .constant(false), movies: Film.sampleFilm)
        .environmentObject(FavoritesModel())
}

struct characters: View{
    let character: String
    let characterName: String
    var body: some View{
        HStack{
            Text(character)
                .font(.system(size: 20, weight: .semibold))
                .padding(.bottom, 0.2)
            
            Text(characterName)
                .font(.system(size: 20, weight: .light))
                
        }
    }
}

struct CharacterDetails: View{
    let characterName: String
    let gender: String
    let age: String
    let eyeColor: String
    let hairColor: String
    
    var body: some View{
        VStack(alignment: .leading){
            Text(characterName)
                .font(.system(size: 20, weight: .bold))
            
            HStack(){
                HStack(){
                    Image(systemName: "person.fill")
                        .resizable()
                        .frame(width: 15, height: 15)
                        .scaledToFit()
                        .foregroundColor(.secondary)
                    
                    Text(gender)
                        .font(.system(size: 15, weight: .semibold))
                        .foregroundColor(.secondary)
                    
                    Text("Age: \(age)")
                        .font(.system(size: 15, weight: .semibold))
                        .foregroundColor(.secondary)
                }
                
                Spacer(minLength: 12)
                
                HStack(){
                    Image(systemName: "eye")
                        .resizable()
                        .frame(width: 15, height: 10)
                        .scaledToFit()
                        .foregroundColor(.secondary)
                    
                    Text(eyeColor)
                        .font(.system(size: 15, weight: .semibold))
                        .foregroundColor(.secondary)
                    
                    Text("Hair: \(hairColor)")
                        .font(.system(size: 15, weight: .semibold))
                        .foregroundColor(.secondary)
                }
                
                
                
            }
            
            
        }
        Divider()
        
    }
}
