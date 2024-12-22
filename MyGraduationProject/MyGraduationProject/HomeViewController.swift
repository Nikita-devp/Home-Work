import UIKit
import FirebaseStorage
import FirebaseDatabase
import MobileCoreServices
import Firebase

protocol HomeViewControllerDelegate {
    func updateData()
}

// MARK: HomeViewController

class HomeViewController: UIViewController {
    
    private let service = AuthService()
    private let storage = Storage.storage()
    
    lazy var label = UILabel()
    lazy var viewImage = UIImageView()
    
    
    lazy var logOutbutton: UIButton = {
        $0.setTitle("LogOut", for: .normal)
        $0.setTitleColor(.systemRed, for: .normal)
        return $0
    }(UIButton(primaryAction: UIAction(handler: {[weak self] _ in
        guard let self = self else {return}
        service.signOut()
        NotificationCenter.default.post(name: Notification.Name(rawValue: "routeVC"), object: nil, userInfo: ["vc": WindowCase.login]) })))
    
    
    lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let collection = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collection.backgroundColor = .systemGray5
        collection.layer.cornerRadius = 34
        collection.translatesAutoresizingMaskIntoConstraints = false
        collection.delegate = self
        return collection }()
    
    
    lazy var pushImageToBase: UIButton = {
        let button = UIButton()
        button.layer.cornerRadius = 10
        button.setImage(UIImage(systemName: "icloud.and.arrow.up.fill"), for: .normal)
        button.backgroundColor = .systemGray5
        return button }()
    
    
    private let addbutton: UIButton = {
        let button = UIButton()
        button.layer.cornerRadius = 10
        button.setImage(UIImage(systemName: "plus"), for: .normal)
        button.backgroundColor = .systemGray5
        return button}()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(pushImageToBase)
        view.addSubview(addbutton)
        view.addSubview(label)
        view.addSubview(collectionView)
        view.addSubview(logOutbutton)
        view.addSubview(viewImage)
        view.backgroundColor = .white
        setupSafeArea()
        

        
        // colleсtion
        collectionView.topAnchor.constraint(equalTo: label.bottomAnchor, constant: 35).isActive = true
        collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10).isActive = true
        collectionView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -10).isActive = true
        collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10).isActive = true
        
        
        // label
        label.text = "My Images"
        label.font = .boldSystemFont(ofSize: 20)
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        label.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 5).isActive = true
        label.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
        
        // add image
        addbutton.translatesAutoresizingMaskIntoConstraints = false
        addbutton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 28).isActive = true
        addbutton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10).isActive = true
        addbutton.widthAnchor.constraint(equalToConstant: 30).isActive = true
        addbutton.heightAnchor.constraint(equalToConstant: 30).isActive = true
        addbutton.addTarget(self, action: #selector(presentImageTarget), for: .touchUpInside)
        
        
        // but logOut
        logOutbutton.translatesAutoresizingMaskIntoConstraints = false
        logOutbutton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 28).isActive = true
        logOutbutton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10).isActive = true
        
        
        // image
        viewImage.translatesAutoresizingMaskIntoConstraints = false
        viewImage.layer.cornerRadius = 40
        viewImage.topAnchor.constraint(equalTo: collectionView.topAnchor, constant: 25).isActive = true
        viewImage.leadingAnchor.constraint(equalTo: collectionView.leadingAnchor, constant: 20).isActive = true
        viewImage.bottomAnchor.constraint(equalTo: collectionView.bottomAnchor, constant: -25).isActive = true
        viewImage.trailingAnchor.constraint(equalTo: collectionView.trailingAnchor, constant: -20).isActive = true
        
        
        // push to base
        pushImageToBase.translatesAutoresizingMaskIntoConstraints = false
        pushImageToBase.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 28).isActive = true
        pushImageToBase.trailingAnchor.constraint(equalTo: addbutton.leadingAnchor, constant: -5).isActive = true
        pushImageToBase.widthAnchor.constraint(equalToConstant: 30).isActive = true
        pushImageToBase.heightAnchor.constraint(equalToConstant: 30).isActive = true
//        pushImageToBase.addTarget(self, action: #selector(), for: .touchUpInside)
}
    
    func uploadFile(fileUrl: URL) {
        let metaData = StorageMetadata()
        
        do {
            // Create file name
            let fileExtension = fileUrl.pathExtension
            let fileName = "demoImageFileName.\(fileExtension)" 
            let storageReference = Storage.storage().reference().child(fileName)
            let currentUploadTask = storageReference.putFile(from: fileUrl, metadata: metaData) { (storageMetaData, error) in
                if let error = error {
                    print("Upload error: \(error.localizedDescription)")
                    return
                }
                print("Image file: \(fileName) is uploaded! View it at Firebase console!")
                
                storageReference.downloadURL { (url, error) in
                    if let error = error  {
                        print("Error on getting download url: \(error.localizedDescription)")
                        return
                    }
                    print("Download url of \(fileName) is \(url!.absoluteString)")
                }
            }
        } catch {
            print("Error on extracting data from url: \(error.localizedDescription)")
        }
    }
            
    
    func setupSafeArea(){
        _ = view.safeAreaLayoutGuide
    }
    
    
    // imagePicker
    @objc func presentImageTarget(){
        let imageMediaType = kUTTypeImage as String
        let pickerController = UIImagePickerController()
           pickerController.sourceType = .photoLibrary
           pickerController.mediaTypes = [imageMediaType]
           pickerController.delegate = self
           present(pickerController, animated: true, completion: nil)
    }
}

extension HomeViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
  func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let selectImage = info[.originalImage] as? UIImage {
            viewImage.image = selectImage }
    let mediaType = info[UIImagePickerController.InfoKey.mediaType] as! CFString
    if mediaType == kUTTypeImage {
      let imageURL = info[UIImagePickerController.InfoKey.imageURL] as! URL
    }
    picker.dismiss(animated: true, completion: nil)
    }
}


extension HomeViewController: UICollectionViewDelegate {
    
    func numberOfSection(in collectionview: UICollectionView) -> Int {
        return 1
    }
}


extension HomeViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        switch indexPath.section {
        case 0: return CGSize(width: UIScreen.main.bounds.width, height: 150)
        case 1: return CGSize(width: UIScreen.main.bounds.width, height: 150)
        case 2: return CGSize(width: UIScreen.main.bounds.width, height: 150)
        default: return CGSize(width: 0, height: 0)
        }
    }
}


extension HomeViewController: HomeViewControllerDelegate {
    func updateData() {
    }
}
