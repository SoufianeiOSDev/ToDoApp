//
//  ListView.swift
//  ToDoApp
//
//  Created by Soufiane Benkhaldoun on 09/01/2022.
//

import SwiftUI

struct ListView: View {
    
    @EnvironmentObject var listViewModel: ListViewModel
    
    var body: some View {
        ZStack {
            if listViewModel.items.isEmpty {
                NoItemsView()
            } else {
                List {
                    ForEach(listViewModel.items) { item in
                        ListRowView(item: item)
                            .onTapGesture {
                                withAnimation(.linear) {
                                    listViewModel.updateItem(item: item)
                                }
                            }
                    }
                    .onDelete(perform: listViewModel.deleteItem )
                    .onMove(perform: listViewModel.moveItem )
                }
            }
        }
        .navigationTitle(Text("Todo List ✏️"))
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                if listViewModel.items.isEmpty {
                    
                } else {
                    EditButton()
                }
            }
            ToolbarItem(placement: .navigationBarTrailing) {
                NavigationLink {
                    AddView()
                } label: {
                    Text("Add")
                }
            }
        }
    }
}

struct ListView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            ListView()
        }
        .environmentObject(ListViewModel() )
.previewInterfaceOrientation(.portrait)
    }
}

