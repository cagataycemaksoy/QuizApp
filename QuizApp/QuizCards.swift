//
//  QuizCards.swift
//  QuizApp
//
//  Created by Cem Aksoy on 28.12.2025.
//

import SwiftUI

struct QuizCards<Content: View>: View {
  @ViewBuilder var content: Content
  
  @State private var count = 0
  @State private var xOffset: CGFloat = .zero
  @State private var rotationDegrees: CGFloat = .zero
  
  var body: some View {
    
    GeometryReader { geo in
      VStack {
        Text("Count: \(count)")
          .font(.title.bold())
        
        Group(subviews: content){ collection in
          ZStack{
            ForEach(collection) { view in
              let indexZ = collection.count - (collection.firstIndex(where: {$0.id == view.id}) ?? 0)
              
              view
                .frame(width: (geo.size.width/3) * 2, height: (geo.size.height/2) * 1.3)
                .background(
                  RoundedRectangle(cornerRadius: 30)
                    .fill(Color(red: 0.98, green: 0.93, blue: 0.83))
                )
                .offset(x: xOffset)
                .rotationEffect(.init(degrees: rotationDegrees))
                .gesture (
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
                .zIndex(Double(indexZ))
            }
          }
        }
        
      }
      .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
    
  }
  
}


#Preview {
    ContentView()
}
