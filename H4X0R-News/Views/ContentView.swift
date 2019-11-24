//
//  ContentView.swift
//  H4X0R-News
//
//  Created by José Javier Cueto Mejía on 24/11/19.
//  Copyright © 2019 José Javier Cueto Mejía. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var networkManager = NetworkManager()
    var body: some View {
        NavigationView{
            List(networkManager.posts){
                posts in
                NavigationLink(destination: DetailView(url: posts.url)){
                    HStack {
                        Text(String(posts.points))
                        Text(posts.title)
                    }
                }
                
            }
            .navigationBarTitle("H4X0R News")
        }
        .onAppear {
            self.networkManager.fetch()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

//
//
//let posts = [
//    Post(id: "1", title: "Hello"),
//    Post(id: "2", title: "Hello2"),
//    Post(id: "3", title: "Hello3")
//]
