//
//  RemoteImage.swift
//  Ghibli App
//
//  Created by Kiran Raju Satihal on 07/02/26.
//

import SwiftUI
import Combine

@MainActor
final class ImageLoader: ObservableObject {
    @Published var image: Image? = nil
    private let service = GhibliServices()
    
    func load(from urlString: String) async {
            do {
                let uiImage = try await service.downloadImage(fromURLString: urlString)
                image = Image(uiImage: uiImage)
            } catch {
                print("❌ Failed to load image:", error)
            }
        }
}

struct RemoteImage: View {
    
    var image: Image?
    
    var body: some View {
        image?
            .resizable()
            ?? Image("food.placeholder").resizable()
    }
}


struct AppetizerRemoteImage: View {
    
    @StateObject private var imageLoader = ImageLoader()
    let urlString: String
    
    var body: some View {
        RemoteImage(image: imageLoader.image)
            .task {
                await imageLoader.load(from: urlString)
            }
    }
}

