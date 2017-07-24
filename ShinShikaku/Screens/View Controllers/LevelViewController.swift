//
//  LevelViewController.swift
//  ShinShikaku
//
//  Created by Matthew Buckley on 7/21/17.
//  Copyright © 2017 Nice Things LLC. All rights reserved.
//

import UIKit
import RxSwift

final class LevelViewController: UIViewController, MVVM {

    // MARK: MVVM
    var viewModel: Any! = LevelViewModel()
    var primaryChildView: UIView! = LevelView()

    let disposeBag = DisposeBag()

    override func viewDidLoad() {
        super.viewDidLoad()
        configureViews()
        configureBindings()
    }

}

extension LevelViewController: ViewConfigurable {
    func configureViews() {
        primaryChildView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(primaryChildView)
    }

    func configureConstraints() {}

    func configureBindings() {
        Observable
            .from(optional: Session.sharedInstance.theme.backgroundColor)
            .subscribe(onNext: { self.view.backgroundColor = $0 })
            .disposed(by: disposeBag)
    }
}
