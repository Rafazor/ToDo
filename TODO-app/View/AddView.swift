//
//  AddView.swift
//  TODO-app
//
//  Created by Calin Rafa on 28.03.2023.
//

import SwiftUI

struct AddView: View {
    //dismiss a view
    @Environment(\.presentationMode) var presentationMode
    
    @EnvironmentObject var listviewmodel: ListViewModel
    
    @State var textFieldText: String = ""
    @State var alertTitle: String = ""
    @State var showAlert:Bool = false
    
    var body: some View {
        ScrollView {
            VStack {
                TextField("Type something....", text: $textFieldText)
                    .padding(.horizontal)
                    .frame(height: 55)
                    .background(Color(hue: 0.6, saturation: 0.048, brightness: 0.916))
                    .cornerRadius(10)
                
                Button(action: saveButtonTapped, label: {
                    Text("Save")
                        .foregroundColor(.white)
                        .font(.headline)
                        .background(Color.accentColor.opacity(0.8))
                        .frame(height: 57)
                })
                
                               
            }
            .padding(16)
        }.navigationTitle("Add an item")
            .alert(isPresented: $showAlert, content: getAlert)
    }
    
    func saveButtonTapped() {
        if textIsValid() {
            listviewmodel.addItem(title: textFieldText)
            presentationMode.wrappedValue.dismiss()
        }
    }
    
    func textIsValid() -> Bool {
        if textFieldText.count < 3 {
            alertTitle = "Add at lest 3 characters 🤝"
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
       
    }
}
