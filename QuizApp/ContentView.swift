//
//  ContentView.swift
//  QuizApp
//
//  Created by Cem Aksoy on 27.12.2025.
//

import SwiftUI

struct ContentView: View {
  @State private var count = 0
  @State private var xOffset: CGFloat = .zero
  @State private var rotationDegrees: CGFloat = .zero
  
  var body: some View {
    GeometryReader { geo in
      VStack {
        Text("Count: \(count)")
          .font(.title.bold())
        
        RoundedRectangle(cornerRadius: 30)
          .fill(Color(red: 0.95, green: 0.9, blue: 0.8))
          .frame(width: (geo.size.width/3) * 2, height: geo.size.height / 2)
          .offset(x: xOffset)
          .rotationEffect(.init(degrees: rotationDegrees))
          .gesture(
            DragGesture()
              .onChanged { value in
                xOffset = value.translation.width
                rotationDegrees = value.translation.width / 15
              }
              .onEnded { _ in
                count += xOffset < 0 ? -1 : 1
                withAnimation(.smooth(duration: 0.5, extraBounce: 0.2)) {
                  xOffset = .zero
                  rotationDegrees = .zero
                }
                
              }
            
          )
      }
      .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
  }
}

#Preview {
    ContentView()
}
