//
//  PhotosCell.swift
//  PhotoSearchProject
//
//  Created by Denis Tarasov on 04.09.2022.
//

import UIKit

protocol photoCellViewModel {
    var photoUrlRegularSize: String { get }
}

class PhotosCell: UICollectionViewCell {

    static let reuseId = "PhotosCell"

    let photoImageView: WebImageView = {
        let imageView = WebImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.backgroundColor = UIColor.init(red: 0.784, green: 0.781, blue: 0.805, alpha: 1)
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()

    override func prepareForReuse() {
        super.prepareForReuse()
        photoImageView.image = nil
    }

    override init(frame: CGRect) {
        super.init(frame: frame)

        setupPhotoImageView()
    }

    func set(viewModel: photoCellViewModel) {
        photoImageView.set(imageUrl: viewModel.photoUrlRegularSize)
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
