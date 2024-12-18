//import UIKit
//import Firebase
//import FirebaseStorage
//import FirebaseDatabase
//
//class APIManager{
//    
//    static let shared = APIManager()
//    
//    private func configureFB() -> Firestore {
//        var db: Firestore!
//        let settings = FirestoreSettings()
//        Firestore.firestore().settings = settings
//        db = Firestore.firestore()
//        return db
//    }
//    
//    func getPost(collections: String, docName: String, complition: @escaping (Document?)-> Void){
//        let db = configureFB()
//        db.collection(collections).document(docName).getDocument(completion: { (document, err) in
//            guard err == nil else {complition(nil); return}
//            let doc = Document(field1: document?.get("field1") as! String, field2: document?.get("field2") as! String)
//            complition(doc)
//        })
//    }
//    
//    func getImage(/*pi*/cName: String, complition: @escaping(UIImage) -> Void){
//        let storage = Storage.storage()
//        let reference = storage.reference()
//        let pathRef = reference.child("pictures")
//        
//        var image: UIImage = UIImage(named: "default_pic")!
//        
//        let fileRef = pathRef.child(picName + ".jpeg")
//        fileRef.getData(maxSize: 1024*1024, completion: { data, err in
//            guard err == nil else {complition(image); return}
//            image = UIImage(data: data!)!
//            complition(image)
//        })
//    }
//}
//
//struct Document {
//    let field1: String
//    let field2: String
//}
