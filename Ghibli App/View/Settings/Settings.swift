//
//  Settings.swift
//  Ghibli App
//
//  Created by Kiran Raju Satihal on 08/02/26.
//

import SwiftUI

struct Settings: View {
    @AppStorage("ColorScheme") private var ColorScheme = false
    @StateObject var viewModel = SystemSettings()
    var body: some View {
        NavigationStack{
            Form{
                Section(header: Text("Appearence")){
                    Toggle(ColorScheme ? "Dark Mode" : "Light Mode", isOn: $ColorScheme)
                    Text("Changes system appearence to always use Light or Dark")
                        .font(.caption)
                        .foregroundColor(.secondary)
                }
                
                Section(header: Text("Account")){
                    TextField("Username", text: $viewModel.userName )
                }
                
                Section(header: Text("Preferences")){
                    Stepper("Items per page: \(viewModel.preferenceCount)", value: $viewModel.preferenceCount, in: 1...5)
                    Toggle(viewModel.Notification ? "Disable Notification" : "Enable Notification", isOn: $viewModel.Notification)
                    
                }
                
                Section(){
                    Button{
                        viewModel.userName =  ""
                        ColorScheme = false
                        viewModel.Notification = false
                        viewModel.preferenceCount = 0
                    } label: {
                        Text("Reset to Defaults")
                            .foregroundStyle(Color.red)
                    }
                    
                    
                }
            }
            .navigationTitle(Text("Settings"))
        }
    }
}

#Preview {
    Settings()
}
