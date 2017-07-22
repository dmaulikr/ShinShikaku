//
//  StartMenuViewController.swift
//  ShinShikaku
//
//  Created by Matthew Buckley on 7/17/17.
//  Copyright © 2017 Nice Things LLC. All rights reserved.
//

import Foundation
import UIKit
import RxSwift

final class StartMenuViewController: UIViewController {

    let expandingHamburgerView: ExpandingHamburgerView = ExpandingHamburgerView()
    let resumeButton: UIButton = {
        let resume = UIButton()
        resume.translatesAutoresizingMaskIntoConstraints = false
        resume.addTarget(self, action: #selector(resumeButtonTapped), for: .touchUpInside)
        return resume
    }()
    private let disposeBag = DisposeBag()

    override func viewDidLoad() {
        super.viewDidLoad()
        configureViews()
        configureConstraints()
        configureBindings()
    }

    @objc func profileButtonTapped() {
        let profileViewController = ProfileViewController()
        present(profileViewController, animated: true)
    }
    @objc func settingsButtonTapped() {
        let settingsViewController = SettingsViewController()
        present(settingsViewController, animated: true)
    }
    @objc func creditsButtonTapped() {
        let creditsViewController = CreditsViewController()
        present(creditsViewController, animated: true)
    }
    @objc func resumeButtonTapped() {
        let levelViewController = LevelViewController()
        present(levelViewController, animated: true)
    }
    @objc func toggleButtonTapped() {}

}

extension StartMenuViewController: ViewConfigurable {

    func configureViews() {
        view.addSubview(expandingHamburgerView)
        view.addSubview(resumeButton)
        view.subviews.forEach({ $0.translatesAutoresizingMaskIntoConstraints = false })
    }

    func configureConstraints() {}

    func configureBindings() {
        Observable
            .from(optional: Session.sharedInstance.theme.backgroundColor)
            .subscribe(onNext: { self.view.backgroundColor = $0 })
            .disposed(by: disposeBag)
    }
}
