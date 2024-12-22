//import UIKit
//import FirebaseStorage
//
//class BaseViewController: UIViewController {
//
//  override func viewDidLoad() {
//    super.viewDidLoad()
//    let notificationName = Notification.Name(rawValue: "uploadTaskDidComplete")
//    NotificationCenter.default.addObserver(self, selector: #selector(uploadTaskDidCompleteHandler), name: notificationName, object: nil)
//  }
//
//  @objc func uploadTaskDidCompleteHandler(notification: Notification) {
//    print("uploadTaskDidCompleteHandler")
//    let storageMetaData = notification.userInfo?["storageMetaData"] as? StorageMetadata
//    let error = notification.userInfo?["error"] as? Error
//  }
//}
