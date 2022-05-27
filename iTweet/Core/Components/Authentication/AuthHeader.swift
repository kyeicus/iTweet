//
//  AuthenticationHeader.swift
//  iTweet
//
//  Created by Emmanuel K. Nketia on 26/05/2022.
//

import SwiftUI

struct AuthHeaderView: View {
    
    let logo : String
    let title : String
    var body: some View {
        VStack(alignment: .center) {
            HStack { Spacer () }
            Image(logo) 
                .resizable()
                .renderingMode(.template)
                .foregroundColor(.white)
                .frame(width: 80, height: 70, alignment: .center)
            Text(title)
                .font(.largeTitle)
                .fontWeight(.semibold)
        }
        .frame( height: 260)
        .padding(.leading)
        .background(Color(.systemBlue))
        .foregroundColor(.white)
        .clipShape(RoundedShape(corners: .bottomRight))
    }
}

struct AuthHeaderView_Previews: PreviewProvider {
    static var previews: some View {
        AuthHeaderView(logo: "tweet", title: "Auth")
    }
}
