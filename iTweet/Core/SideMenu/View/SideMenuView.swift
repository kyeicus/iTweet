//
//  SideMenuView.swift
//  iTweet
//
//  Created by Emmanuel K. Nketia on 26/05/2022.
//
import SwiftUI
import Kingfisher

struct SideMenuView: View {
    @EnvironmentObject var authViewModel : AuthViewModel
    
    var body: some View {
        if let user = authViewModel.currentUser {
            VStack(alignment: .leading, spacing: 32) {
                VStack(alignment: .leading) {
//                    KFImage(URL(string: user.profileImageUrl))
                    AsyncImage(url: URL(string: user.profileImageUrl), content: { prof in
                        prof.resizable()
                            .scaledToFill()
                            .clipShape(Circle())
                            .frame(width: 48, height: 48)

                    }, placeholder: {
                        ProgressView()
                    })
//                    .resizable()
//                    .scaledToFill()
//                    .clipShape(Circle())
//                    .frame(width: 48, height: 48)

                                            
                    VStack(alignment: .leading,spacing: 4) {
                        Text("\(user.FirstName) \(user.Lastname)")
                            .font(.headline)
                        
                        Text ("@\(user.username)")
                            .font(.caption)
                            .foregroundColor(.gray )
                    }
                    UserStatsView()
                        .padding(.vertical)
                }
                .padding(.leading)
                ScrollView {
                    ForEach(SideMenuViewModel.allCases, id: \.rawValue) { viewModel in
                        if viewModel == .profile {
                            NavigationLink {
                                ProfileView(user: user)
                            } label: {
                                SideMenuOptionRowView(viewModel: .profile)
                            }
                        } else if viewModel == .logout {
                            Button {
                                authViewModel.signOut()
                                
                            } label: {
                                SideMenuOptionRowView(viewModel: viewModel)
                            }
                            .foregroundColor(.red)
                            
                        } else {
                            SideMenuOptionRowView(viewModel: viewModel)
                        }
                    }
                    Spacer()
                }
            }
        }
    }
}

