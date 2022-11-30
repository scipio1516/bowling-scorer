//
//  ContentView.swift
//  Bowling Score Counter
//
//  Created by Leo Lai on 11/29/22.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Spacer()
            Text("READY").foregroundColor(Color(red:0.98, green: 0.70, blue:0.97))
            Text("SET").foregroundColor(Color(red:0.7, green: 1.0, blue:0.0))
            Text("BOWL!").foregroundColor(Color(red:1.0, green: 0.2, blue:0.2))
            Spacer()
            
            
        }
        .fontWeight(.bold)
        .font(Font.custom("AvenirNext-Bold", size: 60.0))
        .padding()
        .preferredColorScheme(.dark)
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
