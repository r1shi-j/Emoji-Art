//
//  PaletteEditor.swift
//  Emoji Art
//
//  Created by Rishi Jansari on 20/07/2024.
//

import SwiftUI


struct PaletteEditor: View {
    @Binding var palette: Palette
        
    private let emojiFont = Font.system(size: 40)
    
    enum Focused {
        case name
        case addEmojis
    }
    
    @FocusState private var focused: Focused?
    
    @State private var emojisToAdd = ""
    @State private var isAddShown = false
    @State private var isRemoveIconShown = false
    @State private var isRemoveButtonShown = true
    
    var body: some View {
        Form {
            Section(header: Text("Name")) {
                TextField("Name", text: $palette.name)
                    .focused($focused, equals: .name)
            }
            Section(header: Text("Emojis")) {
                emojiList
            }
        }
        .frame(minWidth: 300, minHeight: 350)
        .onAppear {
            if palette.name.isEmpty {
                focused = .name
            } else {
                focused = .addEmojis
            }
        }
    }

    var emojiList: some View {
        VStack(alignment: .trailing) {
            removeButton
            LazyVGrid(columns: [GridItem(.adaptive(minimum: 40))]) {
                ForEach(palette.emojis.uniqued.map(String.init), id: \.self) { emoji in
                    ZStack {
                        Text(emoji)
                            .onTapGesture {
                                if isRemoveIconShown, isRemoveButtonShown {
                                    withAnimation {
                                        palette.emojis.remove(emoji.first!)

                                    }
                                }
                            }
                        removeIcon
                    }
                }
                plusButton
            }
        }
    }

    var removeButton: some View {
        Text(isRemoveIconShown ? "Stop Removing Emojis" : "Tap to Remove Emojis")
            .font(.caption)
            .foregroundColor(.gray)
            .onTapGesture {
                withAnimation {
                    isRemoveIconShown.toggle()
                }
            }
            .opacity(isRemoveButtonShown ? 1.0 : 0.0)
    }

    var removeIcon: some View {
        Image(systemName: "xmark.circle.fill")
            .foregroundStyle(.red)
            .offset(x:10, y:-10)
            .font(.system(size: 10))
            .opacity(isRemoveIconShown ? 1.0 : 0.0)
    }

    var plusButton: some View {
        Image(systemName: "plus.circle.fill")
            .foregroundStyle(.green)
            .opacity(isRemoveIconShown ? 0.0 : 1.0)
            .onTapGesture {
                withAnimation {
                    isRemoveIconShown = false
                    isAddShown = true
                    isRemoveButtonShown = false
                }
            }
            .sheet(isPresented: $isAddShown, onDismiss: {
                withAnimation {
                    emojisToAdd = ""
                    isRemoveButtonShown = true
                }
            }) {
                TextField("Add Emojis", text: $emojisToAdd)
                    .onChange(of: emojisToAdd) { _, newEmojis in
                        palette.emojis = (newEmojis + palette.emojis)
                            .filter { $0.isEmoji }
                            .uniqued
                    }
                    .focused($focused, equals: .addEmojis)
                    .font(emojiFont)
                    .padding()
                
            }
    }
}
