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

    private let disposeBag = DisposeBag()
    private let expandingHamburgerView: ExpandingHamburgerView = ExpandingHamburgerView()
    private let resumeButton: UIButton = {
        let resume = UIButton()
        resume.translatesAutoresizingMaskIntoConstraints = false
        return resume
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        configureViews()
        configureConstraints()
        configureBindings()
    }

    @objc func profileButtonTapped() {}
    @objc func settingsButtonTapped() {}
    @objc func creditsButtonTapped() {}
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
