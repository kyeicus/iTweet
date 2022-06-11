//
//  MessagesBubble.swift
//  iTweet
//
//  Created by Emmanuel K. Nketia on 11/06/2022.
//

import SwiftUI

struct MessagesBubble: View {
    var message : Message
    @State private var showTime = false
    
    var body: some View {
        VStack (alignment: message.received ? .leading : .trailing){
            HStack{
                Text(message.text)
                    .padding()
                    .foregroundColor(.white)
                    .background(message.received ? Color.gray : Color.blue)
                    .cornerRadius(30)
            }
            .frame(maxWidth: 300,  alignment: message.received ? .leading : .trailing)
            .onTapGesture {
                showTime.toggle()
            }
            if showTime {
                Text("\(message.timeStamp.formatted(date: .omitted, time: .shortened))")
                    .font(.caption2)
                    .padding(message.received ? .leading : .trailing)
            }

        }
        .frame(maxWidth: .infinity, alignment: message.received ? .leading : .trailing)
        .padding(message.received ? .leading : .trailing)
        .padding(.horizontal, 10)
    }
}

struct MessagesBubble_Previews: PreviewProvider {
    static var previews: some View {
        MessagesBubble(message: Message(id: "123", text: "Hello World, I a'm emmanile sd flahfjhfja fafhjfhd fhdf.hd mfhdjf ahdfh ", timeStamp: Date(), received: true))
            .preferredColorScheme(.dark)
    }
}
