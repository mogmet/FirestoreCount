//
//  ContentView.swift
//  FirestoreCount
//
//  Created by mogmet on 2022/10/12.
//

import SwiftUI
import FirebaseFirestore

struct ContentView: View {
    @State var countText: String = "none"
    var body: some View {
        VStack {
            Text(countText)
            Button {
                Task {
                    await loadCount()
                }
            } label: {
                Text("Load count")
            }
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundColor(.accentColor)
            Text("Hello, world!")
        }
        .padding()
    }
    func loadCount() async {
        let aggregateSnapshot = try! await Firestore.firestore().collection("users").count.getAggregation(source: .server)
        countText = aggregateSnapshot.count.stringValue
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
