//
//  UserRowView.swift
//  iTweet
//
//  Created by Emmanuel K. Nketia on 12/05/2022.
//

import SwiftUI

struct UserRowView: View {
    var body: some View {
        HStack (spacing: 12) {
            Circle()
                .frame(width: 48, height: 48)
            
            VStack (alignment: .leading, spacing: 4) {
                Text ("Kyeicus")
                    .font(.subheadline).bold()
                    .foregroundColor(.black)
                
                Text ("Emmanuel K. Nketia")
                    .font(.subheadline)
                    .foregroundColor(.gray)
            }
            Spacer()
        }
        .padding(.horizontal)
        .padding(.vertical, 4)
    }
}

struct UserRowView_Previews: PreviewProvider {
    static var previews: some View {
        UserRowView()
    }
}
