//
//  programmaticNavigationP3.swift
//  navigationproject
//
//  Created by ahmad kaddoura on 1/19/24.
//

import SwiftUI
@Observable
class PathStore{
    var path: [Int]{
        didSet{
            save()
        }
    }
    
    private let savePath = URL.documentsDirectory.appending(path: "SavedPath")
    init(){
        if let data = try? Data(contentsOf: savePath){
            if let decoded = try? JSONDecoder().decode([Int].self, from:data){
                path = decoded
                return
            }
        }
        path = []
    }
    
    func save(){
        do{
            let data = try JSONEncoder().encode(path)
            try data.write(to:savePath)
        }catch{
            print("Failed to save navigation data")
        }
    }
}
struct DetailView: View {
    var number: Int
    @Binding var path: [Int]
    var body: some View {
        NavigationLink("Go to Random Number", value: Int.random(in: 1...1000))
            .navigationTitle("Number: \(number)")
            .toolbar {
                Button("Home") {
                    path = [Int]()
                }
            }
    }
}

struct programmaticNavigationP3: View {
    
    @State private var path = [Int]()
    var body: some View {
        NavigationStack{
            DetailView(number: 0, path: $path)
                .navigationDestination(for: Int.self) { i in
                    DetailView(number: i, path: $path)
                }
        }
    }
}

#Preview {
    programmaticNavigationP3()
}
