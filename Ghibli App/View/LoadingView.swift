//
//  LoadingView.swift
//  Ghibli App
//
//  Created by Kiran Raju Satihal on 07/02/26.
//

import SwiftUI

struct ActivityRepresenter: UIViewRepresentable {
    
    func makeUIView(context: Context) -> UIActivityIndicatorView {
        let activityIndicatorView = UIActivityIndicatorView(style: .large)
        activityIndicatorView.color = UIColor.purple
        activityIndicatorView.startAnimating()
        return activityIndicatorView
    }
    
    func updateUIView(_ uiView: UIActivityIndicatorView, context: Context) {
        
    }
}

struct LoadingView: View{
    var body: some View {
        ZStack{
            LinearGradient(gradient: Gradient(colors: [Color.blue, Color.cyan, Color.mint]), startPoint: .top, endPoint: .bottom)
                .opacity(0.5)
                .edgesIgnoringSafeArea(.all)
            
            ActivityRepresenter()
        }
    }
}

#Preview {
    LoadingView()
}
