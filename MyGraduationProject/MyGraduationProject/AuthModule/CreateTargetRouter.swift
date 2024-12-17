//
//  CreateTargetRouter.swift
//  MyGraduationProject
//
//  Created by Злата Лашкевич on 15.12.24.
//

import UIKit

class CreateTargetRouter {
    static let shared = CreateTargetRouter()
    
    func build(
        delegate: CreateTargetViewControllerDelegate?
    ) -> UIViewController {
        let view = CreateTargetViewController()
        let presenter = CreateTargetPresenter(router: self)
        let interactor = CreateTargetInteractor(presenter: presenter, networkClient: .shared)
        interactor.createDelegate = delegate
        presenter.interactor = interactor
        view.presenter = presenter
        presenter.view = view
        
        view.modalPresentationStyle = .pageSheet
        view.sheetPresentationController?.detents = [.medium()]
        return view
    }
    
    func present(
        on viewController: UIViewController & CreateTargetViewControllerDelegate
    ) {
        let view = build(delegate: viewController)
        viewController.present(view, animated: true)
    }
    
    
    func dismiss(viewController: UIViewController) {
        viewController.dismiss(animated: true)
    }
}
