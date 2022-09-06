//
//  FavoritePhotoCell.swift
//  PhotoSearchProject
//
//  Created by Denis Tarasov on 05.09.2022.
//

import Foundation
import UIKit

protocol FavoritePhotoViewModelProtocols {
    var name: String { get set }
    var photoUrlString: String { get set }
}

class FavoritePhotoCell: UITableViewCell {
    //MARK: - Properties
    static let reuseId = "FavoritePhotoCell"

    //MARK: - UIElements
    let photoImageView: WebImageView = {
        let imageView = WebImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()

    let photoView: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 16
        view.layer.masksToBounds = true
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    let contentViewCell: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    let nameLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = .systemFont(ofSize: 25, weight: .semibold)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    //MARK: - Init
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)

        setupImageView()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func prepareForReuse() {
        super.prepareForReuse()

        nameLabel.text = nil
        photoImageView.image = nil
    }

    //MARK: - setup
    func set(viewModel: FavoritePhotoViewModelProtocols) {
        nameLabel.text = viewModel.name
        photoImageView.set(imageUrl: viewModel.photoUrlString)
    }

    //MARK: - setup constraints
    private func setupImageView() {
        addSubview(contentViewCell)
        contentViewCell.addSubview(photoView)
        photoView.addSubview(photoImageView)
        contentViewCell.addSubview(nameLabel)

        contentViewCell.topAnchor.constraint(equalTo:self.topAnchor).isActive = true
        contentViewCell.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        contentViewCell.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
        contentViewCell.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        contentViewCell.heightAnchor.constraint(equalToConstant: 250).isActive = true

        photoView.topAnchor.constraint(equalTo: contentViewCell.topAnchor, constant: 16).isActive = true
        photoView.leadingAnchor.constraint(equalTo: contentViewCell.leadingAnchor, constant: 16).isActive = true
        photoView.trailingAnchor.constraint(equalTo: contentViewCell.trailingAnchor,constant: -16).isActive = true
        photoView.heightAnchor.constraint(equalToConstant: 190).isActive = true

        photoImageView.topAnchor.constraint(equalTo: photoView.topAnchor).isActive = true
        photoImageView.leadingAnchor.constraint(equalTo: photoView.leadingAnchor).isActive = true
        photoImageView.trailingAnchor.constraint(equalTo: photoView.trailingAnchor).isActive = true
        photoImageView.bottomAnchor.constraint(equalTo: photoView.bottomAnchor).isActive = true

        nameLabel.topAnchor.constraint(equalTo: photoView.bottomAnchor, constant: 16).isActive = true
        nameLabel.leadingAnchor.constraint(equalTo: contentViewCell.leadingAnchor,constant: 16).isActive = true
        nameLabel.trailingAnchor.constraint(equalTo: contentViewCell.trailingAnchor,constant: -16).isActive = true
    }
}
