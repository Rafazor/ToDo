//
//  NoListView.swift
//  TODO-app
//
//  Created by Calin Rafa on 28.03.2023.
//

import SwiftUI

struct NoListView: View {
    @State var animate: Bool = false
    
    var body: some View {
        ScrollView {
            VStack(spacing: 20){
                Text("NO ITEMS")
                    .bold()
                    .font(.title)
                Text("Be more productive and add some TODOs to finish them on time! ")
                    .padding(.bottom, 20)
                NavigationLink(destination: AddView(), label: {
                    Text("Add someting 🔥")
                        .foregroundColor(.black)
                        .font(.headline)
                        .frame(height: 55)
                        .frame(maxWidth: .infinity)
                        .background(animate ? Color("NewColor") : Color.accentColor)
                        .cornerRadius(10)
                }).padding(.horizontal, animate ? 30 : 50)
                    .shadow(color: animate ? Color("newColor").opacity(0.5) : Color.accentColor.opacity(0.5), radius: 20, x: 5, y: 5)
                    .offset(y: animate ? -7 : 0)
                
            }.multilineTextAlignment(.center)
                .padding(40)
                .onAppear(perform: addAnimation)
        }.frame(maxWidth: .infinity, maxHeight: .infinity)
    }
    
    func addAnimation() {
        guard !animate else {
            return
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
            withAnimation(
                Animation
                    .easeInOut(duration: 2.0)
                    .repeatForever()) {
                animate.toggle()
            }
        }
    }
}

struct NoListView_Previews: PreviewProvider {
    static var previews: some View {
        NoListView()
    }
}
