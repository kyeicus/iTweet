//
//  ProfileView.swift
//  iTweet
//
//  Created by Emmanuel K. Nketia on 09/05/2022.
//

import SwiftUI
import Kingfisher

struct ProfileView: View {
    
    @State private var selectedFilter: TweetFilterViewModel = .tweets
    @Environment(\.presentationMode) var mode
    @Namespace var animation
    @ObservedObject var viewModel: ProfileViewModel
    
    init(user: User) {
        self.viewModel = ProfileViewModel(user: user)
    }
    
    var body: some View {
        VStack(alignment: .leading) {
            
            headerView
            
            actionButtons
            
            userInfoDetails
            
            tweetFilterBar
            
            tweetRow
            
            Spacer()
        }
        .navigationBarHidden(true)
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView(user: User(id: NSUUID().uuidString, username: "jj", FirstName: "faf", email: "fads", profileImageUrl: "fsdf", Lastname: "fsdf@gmail.com"))
    }
}

extension ProfileView {
    var headerView: some View {
        ZStack(alignment: .bottomLeading) {
            Color(.systemBlue)
                .ignoresSafeArea()
            
            VStack {
                Button {
                    mode.wrappedValue.dismiss()
                } label: {
                    Image(systemName: "arrow.left")
                        .resizable()
                        .frame(width: 20, height: 16)
                        .foregroundColor(.white)
                        .offset(x: 15, y: -4)
                }
                
                KFImage(URL(string: viewModel.user.profileImageUrl))
                    .resizable()
                    .scaledToFill()
                    .clipShape(Circle())
                    .frame(width: 72, height: 72)
                    .offset(x: 16, y: 24)
            }
        }
        .frame( height: 96)
    }
    
    var actionButtons: some View {
        HStack(spacing: 12) {
            Spacer()
            Image(systemName: "bell.badge")
                .font(.title)
                .padding(6)
                .overlay(Circle().stroke(Color.gray, lineWidth: 0.75))
            Button {
                
            } label: {
                Text(viewModel.actionButtonTitle)
                    .font(.subheadline).bold()
                    .frame(width: 120, height: 32)
                    .overlay(RoundedRectangle(cornerRadius: 20).stroke(Color.gray, lineWidth: 0.75))
            }
            
        }
        .padding(.trailing)
    }
    var userInfoDetails: some View {
        VStack (alignment: .leading, spacing: 4) {
            HStack {
                Text("\(viewModel.user.FirstName) \(viewModel.user.Lastname)")
                    .font(.title2.bold())
                Image(systemName: "checkmark.seal.fill")
                    .foregroundColor(.blue)
            }
            Text("@\( viewModel.user.username)")
                .font(.subheadline)
                .foregroundColor(.gray)
            
            Text ("Hello World! I'm kyeicus")
                .font(.subheadline)
                .padding(.vertical)
            
            HStack(spacing: 32) {
                HStack{
                    Image(systemName:"mappin.and.ellipse")
                    
                    Text("Accra Ghana")
                }
                HStack {
                    Image(systemName: "link")
                    
                    Text("[kyeicus.com](https://kyeicus.github.io)")
                    
                }
            }
            .font(.caption)
            .foregroundColor(.gray)
            
            UserStatsView()
                .padding(.vertical)
        }
        .padding(.horizontal)
    }
    
    var tweetFilterBar: some View {
        
        HStack{
            ForEach(TweetFilterViewModel.allCases, id: \.rawValue) { item in
                VStack {
                    Text (item.tittle)
                        .font(Font.system(size: 12))
                        .font(.subheadline)
                        .fontWeight(selectedFilter == item ? .semibold: .regular)
                        .foregroundColor(selectedFilter == item ? .black : .gray)
                    if selectedFilter == item {
                        Capsule()
                            .foregroundColor(Color.blue)
                            .frame(height: 3)
                            .matchedGeometryEffect(id: "filter", in: animation)
                    } else {
                        Capsule()
                            .foregroundColor(Color(.clear))
                            .frame(height: 3)
                    }
                }
                .onTapGesture {
                    withAnimation(.easeInOut) {
                        self.selectedFilter = item
                    }
                }
            }
        }
        .overlay(Divider().offset(x: 0, y: 16))
    }
    var tweetRow: some View {
        
        ScrollView {
            LazyVStack {
                ForEach (viewModel.tweets(forFilter: self.selectedFilter  )) { tweets in
                    TweetRowView(tweet: tweets)
                        .padding()
                }
            }
        }
    }
}
