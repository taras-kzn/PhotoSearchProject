//
//  PhotosCell.swift
//  PhotoSearchProject
//
//  Created by Denis Tarasov on 04.09.2022.
//

import UIKit

class PhotosCell: UICollectionViewCell {

    static let reuseId = "PhotosCell"

    private let photoImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.backgroundColor = .darkGray
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()

    var photo: Photo! {
        didSet {
            let photoUrl = photo.urls["regular"]
        }
    }

    override func prepareForReuse() {
        super.prepareForReuse()
        photoImageView.image = nil
    }

    override init(frame: CGRect) {
        super.init(frame: frame)

        setupPhotoImageView()
    }


    private func setupPhotoImageView() {
        addSubview(photoImageView)

        photoImageView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        photoImageView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        photoImageView.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        photoImageView.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
