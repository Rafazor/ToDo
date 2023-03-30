//
//  ListView.swift
//  TODO-app
//
//  Created by Calin Rafa on 30.03.2023.
//

import SwiftUI

struct ListView: View {
    @EnvironmentObject var listviewmodel: ListViewModel
    
    var body: some View {
        ZStack {
            if listviewmodel.items.isEmpty {
                NoListView()
                    .transition(AnyTransition.opacity.animation(.easeIn))
            } else {
                List {
                    ForEach(listviewmodel.items) { item in
                        ListRowView(item: item)
                            .onTapGesture {
                                withAnimation(.linear(duration: 0.2)) {
                                    listviewmodel.updateItem(item: item)
                                }
                            }
                    }
                    .onDelete(perform: listviewmodel.deleteItem)
                    .onMove(perform: listviewmodel.moveItem)
                }
            }
        }
        .navigationTitle("ToDo list 🕊️")
        .navigationBarItems(leading: EditButton(), trailing: NavigationLink("Add", destination: AddView()))
    }
}

struct ListView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            ListView()
        }.environmentObject(ListViewModel())
    }
}
