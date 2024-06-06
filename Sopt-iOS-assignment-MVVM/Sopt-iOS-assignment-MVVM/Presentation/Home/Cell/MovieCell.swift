//
//  MovieCell.swift
//  Sopt-iOS-assignment-MVVM
//
//  Created by 심서현 on 6/6/24.
//

protocol MovieCell: BaseCollectionViewCell {
    associatedtype DataType
    static var type: MovieCellEnum { get }
    func DataBind(_ data: DataType, num: Int)
}
