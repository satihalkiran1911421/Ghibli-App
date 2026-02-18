//
//  Alerts.swift
//  Ghibli App
//
//  Created by Kiran Raju Satihal on 07/02/26.
//

import SwiftUI

struct Alerts: Identifiable {
    let id: UUID = UUID()
    let title: Text
    let message: Text
    let dismissButton: Alert.Button
}

struct AlertContext{
    static let invalidURL: Alerts = Alerts(title: Text("Server Error"),
                                           message: Text("we are having some trouble connecting to the server. Please try again later."),
                                           dismissButton: .default(Text("OK")))
    
    static let noData = Alerts(title: Text("Server Error"),
                                        message: Text("There is no Data to show. Please try again later."),
                                        dismissButton: .default(Text("OK")))
    
    static let invalidData = Alerts(title: Text("Server Error"),
                                        message: Text("The data received from server is invalid. Please contact support."),
                                        dismissButton: .default(Text("OK")))
    
    static let invalidResponse = Alerts(title: Text("Server Error"),
                                        message: Text("Invalid response from the server. Please try again later or contact support."),
                                        dismissButton: .default(Text("OK")))
    
    static let jsonParsingFailure = Alerts(title: Text("Server Error"),
                                        message: Text("We received unexpected data from the server. Please try again later."),
                                        dismissButton: .default(Text("OK")))
    
    static let invalidStatuseCode = Alerts(title: Text("Server Error"),
                                        message: Text("We’re having trouble reaching the server right now. Please try again in a few moments."),
                                        dismissButton: .default(Text("OK")))
    
    static let unkownError = Alerts(title: Text("Server Error"),
                                        message: Text("Unable to complete this time. Please check your internet connection."),
                                        dismissButton: .default(Text("OK")))
    
}


