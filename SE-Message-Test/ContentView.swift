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
//https://api.stackexchange.com/2.2/me/inbox?filter=!9_bDE-MZW&access_token=HdJoBb34iVMhaZmkCls48w))&key=ZT8kn8gmTEK79y56UyFLiw((
//https://api.stackexchange.com/2.2/me/inbox?site=stackoverflow&key=ZT8kn8gmTEK79y56UyFLiw((&access_token=2Xw7b0zVAbvze4(ihyEm8Q))

//https://api.stackexchange.com/2.2/users/8902440/inbox?site=stackoverflow&key=ZT8kn8gmTEK79y56UyFLiw((&access_token=x4irzE8qT8vGf*C(ud9kpQ))



//https://stackoverflow.com/oauth?client_id=18315&scope=private_info&redirect_uri=https://chielchiel.nl/stacknotifier/

var sorry: Bool = false

struct ContentView: View {
    var body: some View {
        List {
            InboxItem(MesgTitle: "How can I convert latitude &amp; longitude into north,south,east,west. if its possible In javascript?", MesgBody: "Thanks for updating and the math!", MesgDate: "06/07/2020", MesgId: 0)
            InboxItem(MesgTitle: "Display a table on hover for elements in multiple rows and columns", MesgBody: "This looks great! Thanks for all your efforts here. I&#39;m going to have a play around with it n...", MesgDate: "06/07/2020", MesgId:1)
            InboxItem(MesgTitle: "How can I convert latitude &amp; longitude into north,south,east,west. if its possible In javascript?", MesgBody: "Thanks for updating and the math!", MesgDate: "06/07/2020", MesgId:2)
            InboxItem(MesgTitle: "Display a table on hover for elements in multiple rows and columns", MesgBody: "This looks great! Thanks for all your efforts here. I&#39;m going to have a play around with it n...", MesgDate: "06/07/2020", MesgId:3)
            InboxItem(MesgTitle: "How can I convert latitude &amp; longitude into north,south,east,west. if its possible In javascript?", MesgBody: "Thanks for updating and the math!", MesgDate: "06/07/2020", MesgId:4)
            InboxItem(MesgTitle: "Display a table on hover for elements in multiple rows and columns", MesgBody: "This looks great! Thanks for all your efforts here. I&#39;m going to have a play around with it n...", MesgDate: "06/07/2020", MesgId:5)
            InboxItem(MesgTitle: "How can I convert latitude &amp; longitude into north,south,east,west. if its possible In javascript?", MesgBody: "Thanks for updating and the math!", MesgDate: "06/07/2020", MesgId:6)
            InboxItem(MesgTitle: "Display a table on hover for elements in multiple rows and columns", MesgBody: "This looks great! Thanks for all your efforts here. I&#39;m going to have a play around with it n...", MesgDate: "06/07/2020", MesgId:7)
        }.frame(maxWidth: .infinity, maxHeight: 400)

    }
}

struct InboxItem: View {
    @State var MesgSite: String = "https://duckduckgo.com"
    //@EnvironmentObject var shouldPreview: preview
    @State var MesgTitle: String
    @State var MesgBody: String
    @State var MesgDate: String
    @State private var SelectColor: Color = .black
    @State var MesgId: Int
    @State var showSafari = false
    //@State private var shouldPreview: Bool = sorry

    var body: some View {
        VStack(alignment: .leading) {
            Text(MesgTitle)
                .bold()
            Text(MesgBody)
            Text(MesgDate)
                .italic()
            }
        .onAppear {
            //print(sorry)
        }
        .background(SelectColor.opacity(0.5))
        //.background(KeyEventHandling())
        .onLongPressGesture {
            self.SelectColor = .blue
            self.showSafari = true
            print("nu preview laten zien. id = \(self.MesgId)")
            self.sheet(isPresented: self.$showSafari) {
                SafariPreview()
            }
        }
    }


}

struct SafariPreview: View {

    //let url: URL //url:URL(string: self.MesgSite)!
    var body: some View {
        Rectangle()
        .size(width: 300, height: 200)
            .background(Color.red)
    }

}

//struct KeyEventHandling: NSViewRepresentable {
//    //@EnvironmentObject var shouldPreview: preview
//    class KeyView: NSView {
//        override var acceptsFirstResponder: Bool { true }
//        override func keyDown(with event: NSEvent) {
//            super.keyDown(with: event)
//            if event.characters == " " {
//                print("Spacebar")
//                sorry = !sorry
//            }
//        }
//    }
//
//    func makeNSView(context: Context) -> NSView {
//        let view = KeyView()
//        DispatchQueue.main.async { // wait till next event cycle
//            view.window?.makeFirstResponder(view)
//        }
//        return view
//    }
//
//    func updateNSView(_ nsView: NSView, context: Context) {
//    }
//}

//struct TestKeyboardEventHandling: View {
//    var body: some View {
//        Text("Hello, World!")
//            .background(KeyEventHandling())
//    }
//}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
