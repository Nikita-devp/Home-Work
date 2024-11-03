import UIKit

class ViewController: UIViewController {

    lazy var button = UIButton()
    lazy var viewImage = UIImageView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(button)
        view.addSubview(viewImage)
        
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Изменить фото", for: .normal)
        button.backgroundColor = .blue
        button.layer.cornerRadius = 20
        button.setTitleColor(.white, for: .normal)
        button.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        button.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: 10).isActive = true
        button.addTarget(self, action: #selector(presentImageTarget), for: .touchUpInside)
        
        viewImage.translatesAutoresizingMaskIntoConstraints = false
        viewImage.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 15).isActive = true
        viewImage.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -50).isActive = true
        viewImage.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10).isActive = true
        viewImage.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10).isActive = true
        
    }


    @objc func presentImageTarget(){
        let controller = UIImagePickerController()
        present(controller, animated: true)
        controller.delegate = self
    }
}

extension ViewController: UIImagePickerControllerDelegate & UINavigationControllerDelegate {

    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let selectImage = info[.originalImage] as? UIImage {
            viewImage.image = selectImage
            self.dismiss(animated: true)
        }
    }
}
