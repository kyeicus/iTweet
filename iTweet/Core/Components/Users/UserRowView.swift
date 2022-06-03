//
//  UserRowView.swift
//  iTweet
//
//  Created by Emmanuel K. Nketia on 12/05/2022.
//

import SwiftUI
import Kingfisher

struct UserRowView: View {
    let user: User
    var body: some View {
        HStack (spacing: 12) {
            KFImage(URL(string: user.profileImageUrl))
                .resizable()
                .scaledToFill()
                .clipShape(Circle())
                .frame(width: 48, height: 48)
            
            VStack (alignment: .leading, spacing: 4) {
                Text (user.username)
                    .font(.subheadline).bold()
                    .foregroundColor(.black)
                
                Text ("\(user.FirstName) \(user.Lastname)")
                    .font(.subheadline)
                    .foregroundColor(.gray)
            }
            Spacer()
        }
        .padding(.horizontal)
        .padding(.vertical, 4)
    }
}

//struct UserRowView_Previews: PreviewProvider {
//    static var previews: some View {
//        UserRowView()
//    }
//}
