//
//  ContentView.swift
//  SE-Message-Test
//
//  Created by Michiel Schouten on 15/07/2020.
//  Copyright © 2020 Michiel Schouten. All rights reserved.
//

import SwiftUI
import SafariServices
import Combine

struct ContentView: View {
    var body: some View {
        List {
            InboxItem(MesgTitle: "Duckduckgo", MesgUrl: "https://duckduckgo.com/", MesgId: 0)
            InboxItem(MesgTitle: "Google", MesgUrl: "https://google.com", MesgId:1)
           }.frame(maxWidth: .infinity, maxHeight: 400)

    }
}

struct InboxItem: View {
    @State var MesgUrl: String
    @State var MesgTitle: String
    @State var MesgId: Int
    @State private var SelectColor: Color = .black
    @State var showSafari = false

    var body: some View {
        VStack(alignment: .leading) {
            Text(MesgTitle)
                .bold()  
        }
        .background(SelectColor.opacity(0.5))
        .onLongPressGesture {
            self.SelectColor = .blue
            self.showSafari.toggle()

            self.sheet(isPresented: self.$showSafari) {
                SafariPreview(site: self.MesgUrl)
            }
        }
        .popover(isPresented: self.$showSafari) {
            SafariPreview()
        }
    }


}

struct SafariPreview: View {
   var body: some View {
        VStack {
            Text("Display the webpage here")
            .padding()
        }.frame(maxWidth: 533, maxHeight: 300)
    }

}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
