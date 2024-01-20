//
//  ContentView.swift
//  navigationproject
//
//  Created by ahmad kaddoura on 1/18/24.
//
import SwiftUI

struct Student : Hashable{
    var id = UUID()
    var name  : String
    var age : Int
}


struct ContentView: View {
    
    @State private var title = "Hello"
    var body: some View {
        NavigationStack{
            Text("Toolbar")
                .toolbar{
                    ToolbarItem(placement: .primaryAction){
                        Button("Toolbar Button"){
                        
                        }
                    }
                    
                }.navigationBarBackButtonHidden()

            List{
                NavigationLink("Mint",value: Color.mint)
                NavigationLink("red",value: Color.red)
                NavigationLink("blue",value: Color.blue)
                NavigationLink("yellow",value: Color.yellow)
            }
            .navigationDestination(for: Color.self){ color in
                ColorDetail(color:color)
            }
            .navigationTitle($title)
            .navigationBarTitleDisplayMode(.inline)
            .toolbarBackground(.blue)
            .toolbarColorScheme(.dark)
            //.toolbar(.hidden,for:.navigationBar)
        }
    }
}

#Preview {
    ContentView()
}
