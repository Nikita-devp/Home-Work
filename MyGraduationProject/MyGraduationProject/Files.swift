//
//  Files.swift
//  MyGraduationProject
//
//  Created by Злата Лашкевич on 14.12.24.
//

struct Document {
    let documentName: String
    
    var title: String {
        "Doc name \(documentName)"
    }
}


extension Document {
    static func getDocument() -> [Document] {
        [ Document(documentName: "Documentes"),
        Document(documentName: "wdonfwonv")]
    }
}
