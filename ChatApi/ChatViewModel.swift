//
//  ChatViewModel.swift
//  ChatApi
//
//  Created by ilayda korkmaz on 20.07.2023.
//

import Foundation
extension ChatView {
    class ViewModel: ObservableObject {
        @Published var messages: [Mesagge] = []
        @Published var currentInput: String = ""
        
        private let openAIService = OpenAIService()
        
       func sendMessage() {
           let newMessage = Mesagge(id: UUID(), role: .user, content: currentInput, createAt: Date())
           messages.append(newMessage)
           currentInput = ""
           
           Task {
               let response = await openAIService.sendMessage(messages: messages)
               guard let receivesOpenAIMessage = response?.choices.first?.message else {
                   print("Gelen Mesaj Yok")
                   return
               }
               let receivedMesage = Mesagge(id: UUID(), role: receivesOpenAIMessage.role, content: receivesOpenAIMessage.content, createAt: Date())
               await MainActor.run {
                   messages.append(receivedMesage)
               }
           }
         }
    }
}
struct Mesagge: Decodable {
    let id: UUID
    let role: SenderRole
    let content: String
    let createAt: Date
}

