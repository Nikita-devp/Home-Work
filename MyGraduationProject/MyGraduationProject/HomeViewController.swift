import UIKit

protocol HomeViewControllerDelegate {
    func updateData()
}

// MARK: HomeViewController

class HomeViewController: UIViewController {
    
    lazy var label = UILabel()
    
    lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let collection = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collection.backgroundColor = .systemGray5
        collection.layer.cornerRadius = 34
        collection.translatesAutoresizingMaskIntoConstraints = false
        collection.register(CollectionContainerViewCell.self, forCellWithReuseIdentifier: CollectionContainerViewCell.id)
        collection.delegate = self
        collection.dataSource = self
        return collection }()
    
    private let addbutton: UIButton = {
        let button = UIButton()
        button.layer.cornerRadius = 10
        button.setImage(UIImage(systemName: "plus"), for: .normal)
        button.backgroundColor = .systemGray5
        return button}()
    
    let vc = UIDocumentPickerViewController(documentTypes: ["doc", "pdf"], in: .import)
    
    var user: User?
    
    let service = AuthService()
    let elementServise = ElementService()
    
    @MainActor
    var list: [Element] = [] {
        didSet{
            collectionView.reloadData()
        }
    }
    
    func loadUserData() {
            Task {
                let currentUser = await service.getUserData()
                let elements = await elementService.readElements()
                Task { @MainActor in
                    self.user = currentUser
                    self.list = elements
                    if user != nil {
                        guard let name = user?.name, let surename = user?.surename else { return }
                        fullNamelabel.text = "User: \(name) \(surename)"
                    }
                }
            }
        }
    
    override func viewWillAppear(_ animated: Bool) {
            self.loadUserData()
        }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.white
        view.addSubview(addbutton)
        view.addSubview(label)
        view.addSubview(collectionView)
        setupSafeArea()

        
        
        collectionView.topAnchor.constraint(equalTo: label.bottomAnchor, constant: 35).isActive = true
        collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10).isActive = true
        collectionView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -10).isActive = true
        collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10).isActive = true
        
        
        label.text = "My Document"
        label.font = .boldSystemFont(ofSize: 20)
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        label.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 5).isActive = true
        label.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
        addbutton.translatesAutoresizingMaskIntoConstraints = false
        addbutton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 28).isActive = true
        addbutton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10).isActive = true
        addbutton.widthAnchor.constraint(equalToConstant: 30).isActive = true
        addbutton.heightAnchor.constraint(equalToConstant: 30).isActive = true
        addbutton.addAction(UIAction(handler: {_ in
            self.navigationController?.pushViewController(self.vc, animated: true)
        }), for: .touchUpInside)
        
        
    }
    
    func setupSafeArea(){
        let safeArea = view.safeAreaLayoutGuide
    }
}


extension HomeViewController: UIDocumentPickerDelegate {
    func documentPicker(_ controller: UIDocumentPickerViewController, didPickDocumentsAt urls: [URL]) {
        print("yes")
    }
}


extension HomeViewController: UICollectionViewDelegate {
    
    func numberOfSection(in collectionview: UICollectionView) -> Int {
        return 3
    }
}


extension HomeViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CollectionContainerViewCell.id, for: indexPath) as! CollectionContainerViewCell
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
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


// MARK: CollectionContainerViewCell

class CollectionContainerViewCell: UICollectionViewCell {
    
    static let id = "collectionContainerView"
    lazy var saveButton = UIButton()
    lazy var trashButton = UIButton()
    
    lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.itemSize = CGSize(width: 320, height: 75)
        let collection = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collection.backgroundColor = .systemGray3
        collection.layer.cornerRadius = 20
        collection.translatesAutoresizingMaskIntoConstraints = false
        collection.delegate = self
        collection.dataSource = self
        collection.register(InnerCollectionViewCell.self, forCellWithReuseIdentifier: InnerCollectionViewCell.id)
        return collection
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.addSubview(collectionView)
        addButton()
        
        
        NSLayoutConstraint.activate([collectionView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 15),
                                     collectionView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
                                     collectionView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
                                     collectionView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -5)
                                    ])}
    
    func addButton(){
        contentView.addSubview(saveButton)
        contentView.addSubview(trashButton)
        
        saveButton.setImage(UIImage(systemName: "square.and.arrow.down"), for: .normal)
        saveButton.translatesAutoresizingMaskIntoConstraints = false
        saveButton.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -13).isActive = true
        saveButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -35).isActive = true
        //        saveButton.addTarget(<#T##target: Any?##Any?#>, action: <#T##Selector#>, for: <#T##UIControl.Event#>)
        
        trashButton.setImage(UIImage(systemName: "trash"), for: .normal)
        trashButton.tintColor = .systemRed
        trashButton.translatesAutoresizingMaskIntoConstraints = false
        trashButton.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -13).isActive = true
        trashButton.trailingAnchor.constraint(equalTo: saveButton.trailingAnchor, constant: -40).isActive = true
        //        trashButton.addTarget(<#T##target: Any?##Any?#>, action: <#T##Selector#>, for: <#T##UIControl.Event#>)
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}


extension CollectionContainerViewCell: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: InnerCollectionViewCell.id, for: indexPath) as! InnerCollectionViewCell
        return cell
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
    }
}


extension CollectionContainerViewCell: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 12, left: 15, bottom: 10, right: 15)
    }
}


// MARK: InnerCollectionViewCell

class InnerCollectionViewCell: UICollectionViewCell {
    
    static let id = "InnerCpllectionViewCell"
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.backgroundColor = .systemBlue
        contentView.layer.cornerRadius = 35
        setupConstraints()
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupConstraints(){
        
    }
}


extension UIViewController {
    func hideNavigationBar() {
        self.navigationController?.setNavigationBarHidden(true, animated: true)
    }
    
    func showNavigationBar() {
        self.navigationController?.setNavigationBarHidden(false, animated: true)
    }
}
