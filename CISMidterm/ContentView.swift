//
//  ContentView.swift
//  Midterm_HasanDababo
//
//  Midterm Project
//    Hasan Dababo
//    2025-10-20
//
//  Purpose:
//  This SwiftUI app displays a curated list of Frutiger-inspired visual themes, such as Frutiger Aero, Dark Aero, and Technozen. The app loads its data from a local Data.json file and uses SwiftUI’s NavigationView and List to present each theme with an image and title.
//  - Show a list with image + name for each item.
//  - Tap navigates to DetailView with larger image, name, description.
//  - Uses ForEach() and NavigationLink() as required.
//

import SwiftUI

struct ContentView: View {
    // load once from the bundled JSON using the provided decode helper.
    // (Keys/structure come from Subject.swift and Data.json)
    private let subjects: [Subject] = Bundle.main.decode([Subject].self, from: "Data.json")

    var body: some View {
        NavigationView {
            List {
                // explicit ForEach to satisfy assignment requirement
                ForEach(subjects) { item in
                    NavigationLink(destination: DetailView(subject: item)) {
                        HStack(spacing: 16) {
                            Image(item.imageName)         // must exist in Assets.xcassets
                                .resizable()
                                .scaledToFill()
                                .frame(width: 110, height: 75)
                                .clipped()
                                .cornerRadius(8)

                            Text(item.name)
                                .font(.title3)
                                .foregroundColor(.blue)
                                .lineLimit(1)
                                .accessibilityLabel(Text(item.name))
                        }
                        .padding(.vertical, 4)
                    }
                }
            }
            .listStyle(.plain)
            // **Rubric:** title includes your name
            .navigationTitle("Hasan’s \(/* e.g. */ "Frutiger Aero Aesthetics") list")
        }
    }
}

#Preview {
    ContentView()
}

