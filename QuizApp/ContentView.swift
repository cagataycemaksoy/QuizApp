//
//  ContentView.swift
//  QuizApp
//
//  Created by Cem Aksoy on 27.12.2025.
//

import SwiftUI

struct ContentView: View {
  private let learnedWords = ["der Pasch", "der Schalthebel", "das Gaspedal", "die Haltestelle", "die Einbahnstraße", "anfahren", "der Gang"]
  
  var body: some View {
    QuizCards {
      ForEach(learnedWords, id: \.self) { word in
        Text(word)
          .font(.title)
          .fontWeight(.medium)
      }
    }
  }
}

#Preview {
    ContentView()
}
