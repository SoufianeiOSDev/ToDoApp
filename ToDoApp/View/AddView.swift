//
//  AddView.swift
//  ToDoApp
//
//  Created by Soufiane Benkhaldoun on 09/01/2022.
//

import SwiftUI

struct AddView: View {
    
    @Environment(\.dismiss) var dismiss
    
    @EnvironmentObject var listViewModel: ListViewModel
    
    @State var textfieldText: String = ""
    
    @State var alertTitle: String = ""
    @State var showAlert: Bool = false
    
    var body: some View {
        ScrollView {
            VStack (spacing: 20) {
                TextField("Type here...", text: $textfieldText)
                    .padding(.horizontal)
                    .frame(height: 55)
                    .background(Color(UIColor.secondarySystemBackground))
                    .cornerRadius(15)
                
                Button {
                    saveButton()
                } label: {
                    Text("Save".uppercased())
                        .foregroundColor(.white)
                        .font(.headline)
                        .frame(height: 55)
                        .frame(maxWidth: .infinity)
                        .background(Color.accentColor)
                        .cornerRadius(15)
                }

            }
            .padding(14)
        }
        .navigationTitle("Add task")
        .alert(isPresented: $showAlert, content: getAlert)
    }
    
    func saveButton() {
        if textIsAppropriate() {
            listViewModel.addItem(title: textfieldText)
            dismiss()
            textfieldText = ""
        }
    }
    
    func textIsAppropriate() -> Bool {
        if textfieldText.count < 1 {
            alertTitle = "Field empty"
            showAlert.toggle()
            return false
        }
        return true
    }
    
    func getAlert() -> Alert {
        return Alert(title: Text(alertTitle))
    }
}

struct AddView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            AddView()
        }
        .environmentObject(ListViewModel())
    }
}
