//
//  programmaticNavigation.swift
//  navigationproject
//
//  Created by ahmad kaddoura on 1/19/24.
//

import SwiftUI

struct programmaticNavigation: View {
    @State private var path = [Int]()
    
    var body: some View {
        
        NavigationStack(path: $path){
            //  structs use hashes
            VStack{
                // users navigate to specific paths
                Button("Show 32"){
                    path = [32]
                }
                Button("Show 62"){
                    path.append(64)
                }
                Button("Show 32 and 64"){
                    // sets path to 64 then back to 32 then back to home
                    path = [32,64]
                }
            }
            .navigationDestination(for: Int.self){
                selection in
                Text("You selected \(selection)")
            }
            
            
            
            NavigationLink("tap name"){
                //dont use navigation link with dynamic data
                Text("dont use navigation link with dynamic data")
            }
        }
    }
}

#Preview {
    programmaticNavigation()
}
