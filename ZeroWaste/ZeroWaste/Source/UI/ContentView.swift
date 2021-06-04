//
//  ContentView.swift
//  ZeroWaste
//
//  Created by Tim on 2021/04/18.
//

import SwiftUI

//<Model: ViewModelType>
struct ContentView: View {
    
//    @EnvironmentObject var model: Model
    
    @State private var count: Int = 0
    var body: some View {
        Text("count: \(count)")
        
        Button("count up", action: {
            count += 1
        })
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
