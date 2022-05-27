//
//  SideMenuView.swift
//  iTweet
//
//  Created by Emmanuel K. Nketia on 26/05/2022.
//

import SwiftUI

struct SideMenuView: View {
    @EnvironmentObject var authViewModel : AuthViewModel
    
    var body: some View {
        
        VStack(alignment: .leading, spacing: 32) {
            VStack(alignment: .leading) {
                Circle()
                    .frame(width: 48, height: 48)
                
                VStack(alignment: .leading,spacing: 4) {
                    Text("Emmanuel K. Nketia")
                        .font(.headline)
                    
                    Text ("@Kyeicus")
                        .font(.caption)
                        .foregroundColor(.gray )
                }
                UserStatsView()
                    .padding(.vertical)
            }
            .padding(.leading)
            
            ForEach(SideMenuViewModel.allCases, id: \.rawValue) { viewModel in
                if viewModel == .profile {
                    NavigationLink {
                        ProfileView()
                    } label: {
                        SideMenuOptionRowView(viewModel: .profile)
                    }
                } else if viewModel == .logout {
                    Button {
                        authViewModel.signOut()
                        
                    } label: {
                        SideMenuOptionRowView(viewModel: viewModel)
                    }
                    
                } else {
                    SideMenuOptionRowView(viewModel: viewModel)
                }
            }
            Spacer()
        }
    }
}

struct SideMenuView_Previews: PreviewProvider {
    static var previews: some View {
        SideMenuView()
    }
}
