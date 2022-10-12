//
//  FirestoreCountApp.swift
//  FirestoreCount
//
//  Created by mogmet on 2022/10/12.
//

import SwiftUI
import Firebase
import FirebaseFirestore

@main
struct FirestoreCountApp: App {
    init() {
        FirebaseApp.configure()
        let settings = Firestore.firestore().settings
        settings.host = "localhost:8080"
        settings.isPersistenceEnabled = false
        settings.isSSLEnabled = false
        Firestore.firestore().settings = settings

    }
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
