//
//  ContentView.swift
//  ChatApi
//
//  Created by ilayda korkmaz on 18.07.2023.
//

import SwiftUI

struct ChatView: View {
@ObservedObject var viewModel = ViewModel()
    var body: some View {
        VStack {
            ScrollView {
                ForEach(viewModel.messages.filter({$0.role != .system}), id: \.id) {
                    message in messageView(message: message)
                }
                
            }
            HStack{
                TextField("Mesaj Giriniz...", text: $viewModel.currentInput)
                Button {
                    viewModel.sendMessage()
                } label: {
                    Text("Gönder")
                }
        
                
            }
        }
        .padding()
    }
    func messageView(message: Mesagge) -> some View {
        HStack {
            if message.role == .user { Spacer()}
            Text(message.content)
                .padding()
                .background(message.role == .user ? Color.purple : Color.pink.opacity(0.2))
            if message.role == .assistant { Spacer()}
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ChatView()
    }
}
