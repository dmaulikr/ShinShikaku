//
//  ExpandingHamburgerView.swift
//  ShinShikaku
//
//  Created by Matthew Buckley on 7/19/17.
//  Copyright © 2017 Nice Things LLC. All rights reserved.
//

import UIKit

final class ExpandingHamburgerView: UIView {

    private let profileButton = { return ExpandingHamburgerView.menuButton(text: Strings.ExpandableHamburgerView.profileButtonTitle,
                                   target: self,
                                   action: Selector.profileButtonTapped,
                                   for: .touchUpInside) }()

    private let settingsButton = { return ExpandingHamburgerView.menuButton(text: Strings.ExpandableHamburgerView.profileButtonTitle,
                                    target: self,
                                    action: Selector.settingsButtonTapped,
                                    for: .touchUpInside) }()

    private let creditsButton = { return ExpandingHamburgerView.menuButton(text: Strings.ExpandableHamburgerView.profileButtonTitle,
                                   target: self,
                                   action: Selector.creditsButtonTapped,
                                   for: .touchUpInside) }()

    private let toggleButton = UIButton(frame: .zero)

    override init(frame: CGRect) {
        super.init(frame: frame)
        configureViews()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}

extension ExpandingHamburgerView: ViewConfigurable {

    func configureViews() {
        toggleButton.addTarget(self,
                               action: Selector.toggleButtonTapped,
                               for: .touchUpInside)

        [profileButton,
         settingsButton,
         creditsButton,
         toggleButton].forEach({ self.addSubview($0) })
    }

    func configureConstraints() {}

    func configureBindings() {}
}

private extension ExpandingHamburgerView {

    static func menuButton(text: String,
                    target: Any?,
                    action: Selector,
                    for events: UIControlEvents) -> NavPushButton {
        let button = NavPushButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(target, action: action, for: events)
        return button
    }

}
