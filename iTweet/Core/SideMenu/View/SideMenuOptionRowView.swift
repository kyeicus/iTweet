//
//  SideMenuOptionRowView.swift
//  iTweet
//
//  Created by Emmanuel K. Nketia on 26/05/2022.
//

import SwiftUI

struct SideMenuOptionRowView: View {
    let viewModel : SideMenuViewModel
    
    var body: some View {
      
            HStack(spacing: 10) {
                Image(systemName: viewModel.imageName)
                    .font(.headline)
                    .foregroundColor(.primary)
                
                Text(viewModel .title)
                    .font(.subheadline)
                    .foregroundColor(.primary)
                Spacer()
            }
            .frame(height:40)
            .padding(.horizontal)
    }
}

struct SideMenuOptionRowView_Previews: PreviewProvider {
    static var previews: some View {
        SideMenuOptionRowView(viewModel: .profile)
    }
}
