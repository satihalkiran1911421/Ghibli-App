//
//  SystemBackground.swift
//  Ghibli App
//
//  Created by Kiran Raju Satihal on 10/02/26.
//

import Foundation
import Combine

final class SystemSettings: ObservableObject {
    @Published var userName: String = ""
    @Published var Notification = false
    @Published var preferenceCount: Int = 0
}
