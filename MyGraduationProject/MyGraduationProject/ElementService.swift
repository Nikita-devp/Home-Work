import Foundation
import FirebaseFirestore
import FirebaseAuth

protocol ElementServiceLogic {
    func create(element: Element) async
    func readElements() async -> [Element]
}

class ElementService: ElementServiceLogic {
    
    let db: Firestore = Firestore.firestore()
    
    let uid = Auth.auth().currentUser?.uid
    
    
    func create(element: Element) async {
        guard let uid else { return }
        do {
            try db.collection("users")
                .document(uid)
                .collection("elements")
                .document()
                .setData(from: element)
        } catch {
            print(error)
        }
    }
    
    func readElements() async -> [Element] {
        do {
            guard let uid else { return [] }
            let snapshot = try await db.collection("users")
                .document(uid)
                .collection("elements")
                .getDocuments()
            let elements: [Element] = snapshot.documents.compactMap {
                var element = try! $0.data(as: Element.self)
                element.id = $0.documentID
                return element
            }
            return elements
        } catch {
            print(error)
            return []
        }
    }
    
    func update(elementId: String, element: Element) async {
        do {
            guard let uid else { return }
            try await db.collection("users")
                .document(uid)
                .collection("elements")
                .document(elementId)
                .updateData([
                    "name": element.name,
                    "price" : element.price
                ])
        } catch {
            print(error)
        }
    }
    
    func delete(elementId: String) async {
        do {
            guard let uid else { return }
            try await db.collection("users")
                .document(uid)
                .collection("elements")
                .document(elementId)
                .delete()
        } catch {
            print(error)
        }
    }
}
