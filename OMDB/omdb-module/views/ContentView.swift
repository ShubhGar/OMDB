//
//  ContentView.swift
//  OMDB
//
//  Created by Shubham Garg on 07/11/19.
//  Copyright © 2019 Shubham Garg. All rights reserved.
//


import SwiftUI
import Combine

struct ContentView : View {
    @ObservedObject var viewModel: OMDBListViewModel = OMDBListViewModel()
    
    var body: some View {
        NavigationView {
            OMDBList(models: self.viewModel.models)
            .navigationBarTitle(Text("OMDB"))
            .navigationBarItems(leading:
                    Button(action: {
                        self.viewModel.shuffle()
                    }, label: {
                        Text("Shuffle")
                    }),
                trailing:
                    Button(action: {
                        self.viewModel.load()
                    }, label: {
                        Image(systemName: "arrow.2.circlepath")
                    })
            )
        }.onAppear {
            self.viewModel.load()
        }
    }
}

#if DEBUG
let viewModel = OMDBListViewModel()

struct ContentView_Previews : PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
#endif
