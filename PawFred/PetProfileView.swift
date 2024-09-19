//
//  PetProfileView.swift
//  PawFred
//
//  Created by Joana Levtcheva on 06/09/2024.
//

import SwiftUI

struct PetProfileView: View {
    @State private var petName: String = ""
    @State private var petBreed: String = ""
    @State private var petAge: Int = 1
    @State private var petWeight: String = ""
    @State private var petImage: UIImage? = nil
    @State private var isImagePickerPresented: Bool = false

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
            }.padding()

            // Pet Weight Input
            TextField("Pet Weight (kg)", text: $petWeight)
                .keyboardType(.decimalPad)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()

            // Pet Image
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

    // Save Pet Profile
    func savePetProfile() {
        // You can convert weight to Double here
        let weight = Double(petWeight) ?? 0.0

        let newPet = Pet(
            name: petName,
            breed: petBreed,
            age: petAge,
            weight: weight,
            photo: petImage?.jpegData(compressionQuality: 0.8)
        )

        // Save the pet profile (this could be saved to local storage)
        print("Pet saved: \(newPet)")
    }
}

