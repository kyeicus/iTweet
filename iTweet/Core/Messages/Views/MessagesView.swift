//
//  MessagesView.swift
//  iTweet
//
//  Created by Emmanuel K. Nketia on 09/05/2022.
//

import SwiftUI

struct MessagesView: View {
    var messageArray = ["hello there", "How are you doing today?", "Glad to hear that🫡", "What's up with you?", " You still in Ghana?"]
    
    var body: some View {
        VStack{
            ScrollView{
                ForEach(messageArray, id: \.self) { text in
                    MessagesBubble(message: Message(id: "123", text: text, timeStamp: Date(), received: true))
                }
            }
            .padding(.top, 10)
        }
    }
}

struct MessagesView_Previews: PreviewProvider {
    static var previews: some View {
        MessagesView()
    }
}
