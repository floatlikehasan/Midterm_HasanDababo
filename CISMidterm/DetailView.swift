import SwiftUI

struct DetailView: View {
    // the selected item passed from the list
    let subject: Subject

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 16) {
                // theme image
                Image(subject.imageName)
                    .resizable()
                    .scaledToFit()
                    .cornerRadius(16)
                    .shadow(radius: 4)

                Divider().padding(.vertical, 4)
                
                // theme name
                Text(subject.name)
                    .font(.title2).bold()
                //theme description
                Text(subject.description)
                    .font(.body)
                    .fixedSize(horizontal: false, vertical: true)

                Spacer(minLength: 0)
            }
            .padding()
        }
        // keep the back title consistent with the list screen
        .navigationTitle("Hasan’s \(/* e.g. */ "Frutiger Aero Aesthetics") list")
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    DetailView(subject: Subject(id: "preview",
                                name: "Sample",
                                description: "Preview description for layout.",
                                imageName: "sample-image"))
}

