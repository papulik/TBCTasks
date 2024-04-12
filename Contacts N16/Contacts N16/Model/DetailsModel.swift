//
//  DetailsModel.swift
//  Contacts N16
//
//  Created by Zuka Papuashvili on 12.04.24.
//

import Foundation

struct DetailsModel {
    
    enum Gender: String {
        case male
        case female
    }
    
    let name: String
    let imageName: String?
    let gender: Gender
    let age: Int
    let hobby: String
    
    static let squadArray: [DetailsModel] = [
        DetailsModel(name: "Nodar Ghachava", imageName: "Avatar Image-4", gender: .male, age: 27, hobby: "Soccer"),
        DetailsModel(name: "Elene Donadze", imageName: "Avatar Image-1", gender: .female, age: 23, hobby: "Reading"),
        DetailsModel(name: "Temuri Chitashvili", imageName: "Avatar Image-4", gender: .male, age: 29, hobby: "Gardening"),
        DetailsModel(name: "Irina Datoshvili", imageName: "Avatar Image-2", gender: .female, age: 32, hobby: "Painting"),
        DetailsModel(name: "Tornike Elqanashvili", imageName: "Avatar Image-4", gender: .male, age: 26, hobby: "Cooking"),
        DetailsModel(name: "Ana Ioramashvili", imageName: "Avatar Image-3", gender: .female, age: 30, hobby: "Running"),
        DetailsModel(name: "Nini Bardavelidze", imageName: "Avatar Image-1", gender: .female, age: 28, hobby: "Swimming"),
        DetailsModel(name: "Barbare Tepnadze", imageName: "Avatar Image-3", gender: .female, age: 25, hobby: "Chess"),
        DetailsModel(name: "Mariam Sreseli", imageName: "Avatar Image-2", gender: .female, age: 24, hobby: "Photography"),
        DetailsModel(name: "Valeri Mekhashishvili", imageName: "Avatar Image-4", gender: .male, age: 31, hobby: "Fishing"),
        DetailsModel(name: "Nutsa Beriashvili", imageName: "Avatar Image-1", gender: .female, age: 27, hobby: "Writing"),
        DetailsModel(name: "Luka Kharatishvili", imageName: "Avatar Image-4", gender: .male, age: 25, hobby: "Traveling"),
        DetailsModel(name: "Data Robakidze", imageName: "Avatar Image-4", gender: .male, age: 28, hobby: "Gaming"),
        DetailsModel(name: "Nik'a Kakhniashvili", imageName: "Avatar Image-4", gender: .male, age: 30, hobby: "Dancing"),
        DetailsModel(name: "Sandro Gelashvili", imageName: "Avatar Image-4", gender: .male, age: 26, hobby: "Yoga"),
        DetailsModel(name: "Ana Namgaladze", imageName: "Avatar Image-3", gender: .female, age: 29, hobby: "Knitting"),
        DetailsModel(name: "Bakar Kharabadze", imageName: "Avatar Image-4", gender: .male, age: 27, hobby: "Playing guitar"),
        DetailsModel(name: "Archil Menabde", imageName: "Avatar Image-4", gender: .male, age: 31, hobby: "Watching movies"),
        DetailsModel(name: "Tamuna Kakhidze", imageName: "Avatar Image-3", gender: .female, age: 24, hobby: "Shopping"),
        DetailsModel(name: "Giorgi Michitashvili", imageName: "Avatar Image-4", gender: .male, age: 28, hobby: "Birdwatching"),
        DetailsModel(name: "Salome Topuria", imageName: "Avatar Image-3", gender: .female, age: 26, hobby: "Singing"),
        DetailsModel(name: "Luka Gujejiani", imageName: "Avatar Image-4", gender: .male, age: 30, hobby: "Meditation"),
        DetailsModel(name: "Gega Tatulishvili", imageName: "Avatar Image-4", gender: .male, age: 25, hobby: "Cycling"),
        DetailsModel(name: "Raisa Badalova", imageName: "Avatar Image-3", gender: .female, age: 29, hobby: "Cooking"),
        DetailsModel(name: "Aleksandre Saroiani", imageName: "Avatar Image-4", gender: .male, age: 27, hobby: "Painting"),
        DetailsModel(name: "Begi Kopaliani", imageName: "Avatar Image-4", gender: .male, age: 30, hobby: "Reading"),
        DetailsModel(name: "Akaki Titberidze", imageName: "Avatar Image-4", gender: .male, age: 26, hobby: "Gardening"),
        DetailsModel(name: "Sandro Kupatadze", imageName: "Avatar Image-4", gender: .male, age: 24, hobby: "Swimming"),
        DetailsModel(name: "Gvantsa Gvagvalia", imageName: "Avatar Image-3", gender: .female, age: 28, hobby: "Photography"),
        DetailsModel(name: "Vano Kvakhadze", imageName: "Avatar Image-4", gender: .male, age: 29, hobby: "Fishing")
    ]

}


