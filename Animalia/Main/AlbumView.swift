//
//  AlbumView.swift
//  Animalia
//
//  Created by Macbook Pro on 30/04/24.
//

import SwiftUI
import PhotosUI

struct AlbumView: View {
    @State private var selectedItems: [PhotosPickerItem] = []
    @State private var selectedImages: [UIImage] = []
    var body: some View {
        VStack {
            // MARK: - DISPLAY SELECTED IMAGES

            if selectedItems.isEmpty {
                ContentUnavailableView("No Photos", systemImage: "photos.on.rectangle", description: Text("To get Started, select some photos below."))
                    .frame(height: 300)
            } else {
                ScrollView(.horizontal) {
                    LazyHStack {
                        ForEach(selectedImages, id: \.self) {
                            image in
                            Image(uiImage: image)
                                .resizable()
                                .scaledToFill()
                                .frame(height: 250)
                                .clipShape(RoundedRectangle(cornerRadius: 24))
                                .padding(.horizontal, 20)
                                .containerRelativeFrame(.horizontal)
                        }
                    }
                }//: SCROLL VIEW
                .frame(height: 300)
            }
            Spacer()
            // MARK: - PHOTOS PICKER

            PhotosPicker(selection: $selectedItems, maxSelectionCount: 5, selectionBehavior: .continuousAndOrdered, matching: .images) {
                Label("Select a Photo", systemImage: "photo")
            }
            .photosPickerStyle(.inline)
//            .photosPickerDisabledCapabilities(.selectionActions)
            .frame(height: 500)
            .ignoresSafeArea()
            .onChange(of: selectedItems) { oldItems, newItems in
                print("OLD Items: \(oldItems.count)")
                print("NEW Items: \(newItems.count)")
                selectedImages = []
                newItems.forEach {
                    newItem in
                    Task {
                        if let data = try? await newItem.loadTransferable(type: Data.self) {
                            if let image = UIImage(data: data) {
                                selectedImages.append(image)
                            }
                        }
                    }
                }
            }
            
        } // VSTACK
        // Simple Implementation
//        PhotosPicker(selection: $selectedItem, matching: .images) {
//            Label("Select a Photo", systemImage: "photo")
//        }
    }
}

#Preview {
    AlbumView()
}
