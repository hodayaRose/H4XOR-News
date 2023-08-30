//
//  ContentView.swift
//  H4XOR News
//
//  Created by Hodaya Rosenberg on 11/22/22.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var networkingManager=NetworkingManager()
    var body: some View {
        NavigationView{
           
            List(networkingManager.posts) { post in
                NavigationLink(destination: DetailView(url: post.url)) {
                       HStack{
                        Text("\(post.points)")
                        Text(post.title)
                        
                    }
                    
                }
             
               
                
            }
       .navigationTitle("H4XOR News")
    }
        .onAppear{ self.networkingManager.fetchData()}
}
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


