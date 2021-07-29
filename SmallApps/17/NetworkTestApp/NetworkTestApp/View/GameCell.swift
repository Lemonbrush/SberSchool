//
//  GameCell.swift
//  NetworkTestApp
//
//  Created by Andrey Khyshov on 23.07.2021.
//

import UIKit

final class GameCell: UITableViewCell {

    static let indentifirer = "GameCell"

    func configure(with model: GetGamesDataResponse) {
        textLabel?.text = model.name
    }
}
