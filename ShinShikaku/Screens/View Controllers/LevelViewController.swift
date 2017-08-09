//
//  LevelViewController.swift
//  ShinShikaku
//
//  Created by Matthew Buckley on 7/21/17.
//  Copyright © 2017 Nice Things LLC. All rights reserved.
//

import UIKit
import RxSwift

final class LevelViewController: UIViewController, LevelViewType {

    // TODO: Remove Dummy Models Here
    private var grid: Grid = {
        let tiles = [Tile(position: .zero, state: .traversable),
                     Tile(position: .zero, state: .traversable)]
        let grid = GridGenerator.generateBoard(with: LevelViewModel.generateTileState(for:), width: 5, height: 5)
        return grid
    }()

    private var winConditions: [WinCondition] = {
        return [WinCondition(position: Position.zero, dimensions: Dimensions(width: 5, height: 5))]
    }()

    lazy private var level: Level = {
        return try! Level(winConditions: self.winConditions, grid: self.grid)
    }()

    // MARK: ViewType
    lazy var viewModel: Any! = {
        return LevelViewModel(level: self.level)
    }()

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
