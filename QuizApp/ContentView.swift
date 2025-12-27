//
//  ContentView.swift
//  QuizApp
//
//  Created by Cem Aksoy on 27.12.2025.
//

import SwiftUI

struct ContentView: View {
  @State private var count = 0
  
  var body: some View {
    GeometryReader { geo in
      VStack {
        Text("Count: \(count)")
          .font(.title.bold())
        
        RoundedRectangle(cornerRadius: 30)
          .fill(Color(red: 0.5, green: 0.7, blue: 0.85))
          .frame(width: (geo.size.width/3) * 2, height: geo.size.height / 2)
        
      }
      .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
  }
}

#Preview {
    ContentView()
}
