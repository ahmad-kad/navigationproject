//
//  programmaticNavigationP2.swift
//  navigationproject
//
//  Created by ahmad kaddoura on 1/19/24.
//

import SwiftUI

struct programmaticNavigationP2: View {
    @State private var path = NavigationPath()
    var body: some View {
        NavigationStack(path: $path){
            List{
                ForEach(0..<5){i in
                    NavigationLink("Select: \(i)", value: i)
                }
                ForEach(0..<5){i in
                    NavigationLink("Select String: \(i)", value: i)
                }
            }
            .toolbar{
                Button("Push New View"){
                    path.append("New View")
                }
                }
            .navigationDestination(for: Int.self){
                selection in
                Text("Selection \(selection)")
                }
            .navigationDestination(for: String.self){
                selection in
                Text("Selection \(selection)")
                }
        }.navigationTitle("Hello")
            .navigationBarTitleDisplayMode(.inline)
            .toolbarBackground(.blue)
            .toolbarColorScheme(.dark)
    }
}

#Preview {
    programmaticNavigationP2()
}
