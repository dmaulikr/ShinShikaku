//
//  LevelViewController.swift
//  ShinShikaku
//
//  Created by Matthew Buckley on 7/21/17.
//  Copyright © 2017 Nice Things LLC. All rights reserved.
//

import UIKit
import RxSwift

final class LevelViewController: UIViewController {

    let disposeBag = DisposeBag()

    override func viewDidLoad() {
        super.viewDidLoad()
        configureBindings()
    }

}

extension LevelViewController: ViewConfigurable {
    func configureViews() {}

    func configureConstraints() {}

    func configureBindings() {
        Observable
            .from(optional: Session.sharedInstance.theme.backgroundColor)
            .subscribe(onNext: { self.view.backgroundColor = $0 })
            .disposed(by: disposeBag)
    }
}
