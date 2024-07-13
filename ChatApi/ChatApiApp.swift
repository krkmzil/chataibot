//
//  ChatApiApp.swift
//  ChatApi
//
//  Created by ilayda korkmaz on 18.07.2023.
//

import SwiftUI
@main 
struct ChatApiApp: App {
    var body: some Scene {
        WindowGroup {
            ChatView()
        }
    }
}

struct Previews_ChatApiApp_Previews: PreviewProvider {
    static var previews: some View {
        /*@START_MENU_TOKEN@*/Text("Hello, World!")/*@END_MENU_TOKEN@*/
    }
}
