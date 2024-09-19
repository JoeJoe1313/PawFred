//
//  PetProfileView.swift
//  PawFred
//
//  Created by Joana Levtcheva on 06/09/2024.
//

import SwiftUI
import CoreData

struct PetProfileView: View {
    @State private var petName: String = ""
    @State private var petBreed: String = ""
    @State private var petAge: Int = 1
    @State private var petWeight: String = ""
    @State private var petImage: UIImage? = nil
    @State private var isImagePickerPresented: Bool = false
    
    @Environment(\.managedObjectContext) private var viewContext // Get the Core Data context

    var body: some View {
        VStack {
            Text("Create Pet Profile")
                .font(.largeTitle)
                .padding()

            // Pet Name Input
            TextField("Pet Name", text: $petName)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()

            // Pet Breed Input
            TextField("Pet Breed", text: $petBreed)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()

            // Pet Age Input
            HStack {
                Text("Age: \(petAge)")
                Stepper("", value: $petAge, in: 1...30)
            }
            .padding()

            // Pet Weight Input
            TextField("Pet Weight (kg)", text: $petWeight)
                .keyboardType(.decimalPad)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()

            // Pet Image (if available)
            if let image = petImage {
                Image(uiImage: image)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 200, height: 200)
                    .clipShape(Circle())
                    .padding()
            } else {
                Button("Select Pet Image") {
                    isImagePickerPresented = true
                }
                .padding()
            }

            // Save Button
            Button(action: savePetProfile) {
                Text("Save Profile")
                    .foregroundColor(.white)
                    .padding()
                    .background(Color.blue)
                    .cornerRadius(10)
            }
            .padding()
        }
        .sheet(isPresented: $isImagePickerPresented) {
            ImagePicker(image: $petImage)
        }
    }

    // Save Pet Profile to Core Data
    func savePetProfile() {
        // Create a new Pet entity in Core Data
        let newPet = PetEntity(context: viewContext)  // Ensure `PetEntity` is correctly defined in Core Data
        
        // Validate and assign values to the Core Data entity
        newPet.name = petName.isEmpty ? nil : petName  // Handle empty string for optional name
        newPet.breed = petBreed.isEmpty ? nil : petBreed
        newPet.age = Int16(petAge)
        newPet.weight = Double(petWeight) ?? 0.0  // Ensure weight is properly converted
        
        // Handle image data
        if let petImage = petImage, let imageData = petImage.jpegData(compressionQuality: 0.8) {
            newPet.photo = imageData
        } else {
            print("No image or failed to convert UIImage to Data.")
        }
        
        // Save the context
        do {
            try viewContext.save()  // Save changes to Core Data
            print("Pet saved successfully!")
        } catch {
            print("Failed to save pet: \(error.localizedDescription)")  // Better error description
        }
    }
}
