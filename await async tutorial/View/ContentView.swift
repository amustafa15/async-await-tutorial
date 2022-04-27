//
//  ContentView.swift
//  await async tutorial
//
//  Created by Ameen Mustafa on 4/25/22.
//

import SwiftUI
import Foundation

struct ContentView: View {
    
    @State private var location: String = ""
    @State private var temp: Double = 0.0
    @StateObject var asyncVM = AsyncViewModel()
    
    var body: some View {
        VStack {
            TextField("forecast for where?", text: $location)
                .frame(alignment: .center)
                .onSubmit() {
                    Task {
                        temp = await asyncVM.executeSearch(for: location)
                    }
                }
                .background(Color.white)
                .border(.secondary)
                .foregroundColor(.blue)
                .padding(.vertical)
            
            Text(location)
                .foregroundColor(.blue)
                .padding(.vertical)
            Text("the temperature is: \(temp)")
            }
        .frame(width: 250, height: 300, alignment: .center)
        
//        Text("Henlo, world!")
//            .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
