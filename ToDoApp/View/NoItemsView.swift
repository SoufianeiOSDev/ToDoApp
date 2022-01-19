//
//  NoItemsView.swift
//  ToDoApp
//
//  Created by Soufiane Benkhaldoun on 11/01/2022.
//

import SwiftUI

struct NoItemsView: View {
    
    @State private var animate: Bool = false
    
    let SecondaryAccentColor = Color("SecondaryAccentColor")
    
    var body: some View {
        ScrollView {
            VStack (spacing: 20) {
                Image(systemName: "exclamationmark.circle.fill")
                    .font(.system(size: 35))
                    .opacity(0.5)
                
                Text("Your Todo list is empty, add you first item by clicking the button Add or below.")
                    .opacity(0.5)
                    .padding(.bottom, 20)
                
                NavigationLink {
                    AddView()
                } label: {
                    Text("Add your first Item!")
                        .font(.headline)
                        .foregroundColor(.white)
                        .frame(height: 55)
                        .frame(maxWidth: .infinity)
                        .background( animate ? SecondaryAccentColor : Color.accentColor)
                        .cornerRadius(15)
                }
                .padding(.horizontal, animate ? 30 : 50)
                .shadow(
                    color: animate ? SecondaryAccentColor.opacity(0.7) : Color.accentColor.opacity(0.7),
                    radius: animate ? 30 : 10,
                    x: 0,
                    y: animate ? 50 : 30)
                
                .scaleEffect(animate ? 1.1 : 1.0)
                .offset(y: animate ? -7 : 0)

            }
            .frame(maxWidth: 400)
            .padding(40)
            .multilineTextAlignment(.center)
            .onAppear(perform: addAnimation)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
    
    func addAnimation() {
        guard !animate else { return }
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
            withAnimation(
                Animation
                    .easeInOut(duration: 2.0)
                    .repeatForever()
            ) {
                animate.toggle()
            }
        }
    }
}

struct NoItemsView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            NoItemsView()
        }
    }
}
