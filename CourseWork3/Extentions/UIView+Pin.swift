//
//  UIView+Pin.swift
//  Willow
//
//  Created by Gregory Pinetree on 01.12.2022.
//

import UIKit

// MARK: - Pin methods
/// Can throw exceptions when there is no common superview between constrained views.
extension UIView {
    enum ConstraintMode {
        case equal
        /// greaterOrEqual
        case grOE
        /// lessOrEqual
        case lsOE
    }

    enum PinSides {
        case top, bottom, left, right
    }

    // MARK: - Pin left
    @discardableResult
    /// Creates and activates a constraint from views leadingAnchor to otherView's leadingAnchor.
    func pinLeft(
        to otherView: UIView,
        _ const: Double = 0,
        _ mode: ConstraintMode = .equal
    ) -> NSLayoutConstraint {
        pinConstraint(mode: mode, leadingAnchor, otherView.leadingAnchor, constant: const)
    }

    @discardableResult
    /// Creates and activates a constraint from views leadingAnchor to an inputed xAxisAnchor.
    func pinLeft(
        to anchor: NSLayoutXAxisAnchor,
        _ const: Double = 0,
        _ mode: ConstraintMode = .equal
    ) -> NSLayoutConstraint {
        return pinConstraint(mode: mode, leadingAnchor, anchor, constant: const)
    }

    // MARK: - Pin right
    @discardableResult
    /// Creates and activates a constraint from views trailingAnchor to otherView's trailingAnchor.
    func pinRight(
        to otherView: UIView,
        _ const: Double = 0,
        _ mode: ConstraintMode = .equal
    ) -> NSLayoutConstraint {
        pinConstraint(mode: mode, trailingAnchor, otherView.trailingAnchor, constant: -1 * const)
    }

    @discardableResult
    /// Creates and activates a constraint from views trailingAnchor to an inputed xAxisAnchor.
    func pinRight(
        to anchor: NSLayoutXAxisAnchor,
        _ const: Double = 0,
        _ mode: ConstraintMode = .equal
    ) -> NSLayoutConstraint {
        return pinConstraint(mode: mode, trailingAnchor, anchor, constant: -1 * const)
    }

    // MARK: - Pin top
    @discardableResult
    /// Creates and activates a constraint from views topAnchor to otherView's topAnchor.
    func pinTop(
        to otherView: UIView,
        _ const: Double = 0,
        _ mode: ConstraintMode = .equal
    ) -> NSLayoutConstraint {
        pinConstraint(mode: mode, topAnchor, otherView.topAnchor, constant: const)
    }

    @discardableResult
    /// Creates and activates a constraint from views topAnchor to an inputed xAxisAnchor.
    func pinTop(
        to anchor: NSLayoutYAxisAnchor,
        _ const: Double = 0,
        _ mode: ConstraintMode = .equal
    ) -> NSLayoutConstraint {
        return pinConstraint(mode: mode, topAnchor, anchor, constant: const)
    }

    // MARK: - Pin bottom
    @discardableResult
    /// Creates and activates a constraint from views bottomAnchor to otherView's bottomAnchor.
    func pinBottom(
        to otherView: UIView,
        _ const: Double = 0,
        _ mode: ConstraintMode = .equal
    ) -> NSLayoutConstraint {
        pinConstraint(mode: mode, bottomAnchor, otherView.bottomAnchor, constant: -1 * const)
    }

    @discardableResult
    /// Creates and activates a constraint from views bottomAnchor to an inputed xAxisAnchor.
    func pinBottom(
        to anchor: NSLayoutYAxisAnchor,
        _ const: Double = 0,
        _ mode: ConstraintMode = .equal
    ) -> NSLayoutConstraint {
        return pinConstraint(mode: mode, bottomAnchor, anchor, constant: -1 * const)
    }

    // MARK: - Pin center

    /// Creates and activates a constraint from views centerXAnchor to otherView's centerXAnchor.
    func pinCenter(to otherView: UIView) {
        pinConstraint(mode: .equal, centerXAnchor, otherView.centerXAnchor)
        pinConstraint(mode: .equal, centerYAnchor, otherView.centerYAnchor)
    }

    @discardableResult
    /// Creates and activates a constraint from views centerXAnchor to otherView's centerXAnchor.
    func pinCenterX(
        to otherView: UIView,
        _ const: Double = 0,
        _ mode: ConstraintMode = .equal
    ) -> NSLayoutConstraint {
        pinConstraint(mode: mode, centerXAnchor, otherView.centerXAnchor, constant: const)
    }

    @discardableResult
    /// Creates and activates a constraint from views centerXAnchor to an inputed xAxisAnchor.
    func pinCenterX(
        to anchor: NSLayoutXAxisAnchor,
        _ const: Double = 0,
        _ mode: ConstraintMode = .equal
    ) -> NSLayoutConstraint {
        return pinConstraint(mode: mode, centerXAnchor, anchor, constant: const)
    }

    @discardableResult
    /// Creates and activates a constraint from views centerYAnchor to otherView's centerYAnchor.
    func pinCenterY(
        to otherView: UIView,
        _ const: Double = 0,
        _ mode: ConstraintMode = .equal
    ) -> NSLayoutConstraint {
        pinConstraint(mode: mode, centerYAnchor, otherView.centerYAnchor, constant: const)
    }

    @discardableResult
    /// Creates and activates a constraint from views centerYAnchor to an inputed yAxisAnchor.
    func pinCenterY(
        to anchor: NSLayoutYAxisAnchor,
        _ const: Double = 0,
        _ mode: ConstraintMode = .equal
    ) -> NSLayoutConstraint {
        return pinConstraint(mode: mode, centerYAnchor, anchor, constant: const)
    }

    // MARK: - Pin width
    @discardableResult
    /// Creates and activates a constraint from views widthAnchor to otherView's widthAnchor.
    func pinWidth(
        to otherView: UIView,
        _ mult: Double = 1,
        _ mode: ConstraintMode = .equal
    ) -> NSLayoutConstraint {
        pinConstraint(mode: mode, widthAnchor, otherView.widthAnchor, multiplier: mult)
    }

    @discardableResult
    /// Creates and activates a constraint from views widthAnchor to an inputed NSLayoutDimension.
    func pinWidth(
        to anchor: NSLayoutDimension,
        _ mult: Double = 1,
        _ mode: ConstraintMode = .equal
    ) -> NSLayoutConstraint {
        pinConstraint(mode: mode, widthAnchor, anchor, multiplier: mult)
    }

    @discardableResult
    func setWidth(mode: ConstraintMode = .equal, _ const: Double) -> NSLayoutConstraint {
        pinDimension(mode: mode, widthAnchor, constant: const)
    }

    // MARK: - Pin height
    @discardableResult
    /// Creates and activates a constraint from views heightAnchor to otherView's heightAnchor.
    func pinHeight(
        to otherView: UIView,
        _ mult: Double = 1,
        _ mode: ConstraintMode = .equal
    ) -> NSLayoutConstraint {
        return pinConstraint(mode: mode, heightAnchor, otherView.heightAnchor, multiplier: mult)
    }

    @discardableResult
    /// Creates and activates a constraint from views heightAnchor to an inputed NSLayoutDimension.
    func pinHeight(
        to anchor: NSLayoutDimension,
        _ mult: Double = 1,
        _ mode: ConstraintMode = .equal
    ) -> NSLayoutConstraint {
        return pinConstraint(mode: mode, heightAnchor, anchor, multiplier: mult)
    }

    @discardableResult
    func setHeight(mode: ConstraintMode = .equal, _ const: Double) -> NSLayoutConstraint {
        pinDimension(mode: mode, heightAnchor, constant: const)
    }

    // MARK: - Pin utilities
    func pinHorizontal(to otherView: UIView, _ const: Double = 0) {
        pinLeft(to: otherView, const)
        pinRight(to: otherView, const)
    }

    func pinVertical(to otherView: UIView, _ const: Double = 0) {
        pinTop(to: otherView, const)
        pinBottom(to: otherView, const)
    }

    func pin(to otherView: UIView, _ const: Double = 0) {
        pinVertical(to: otherView, const)
        pinHorizontal(to: otherView, const)
    }

    // MARK: - Private methods
    @discardableResult
    private func pinConstraint<Axis: AnyObject, AnyAnchor: NSLayoutAnchor<Axis>>(
        mode: ConstraintMode,
        _ firstConstraint: AnyAnchor,
        _ secondConstraint: AnyAnchor,
        constant: Double = 0
    ) -> NSLayoutConstraint {
        let const = CGFloat(constant)
        let result: NSLayoutConstraint
        translatesAutoresizingMaskIntoConstraints = false
        switch mode {
        case .equal:
            result = firstConstraint.constraint(equalTo: secondConstraint, constant: const)
        case .grOE:
            result = firstConstraint.constraint(greaterThanOrEqualTo: secondConstraint, constant: const)
        case .lsOE:
            result = firstConstraint.constraint(lessThanOrEqualTo: secondConstraint, constant: const)
        }

        result.isActive = true
        return result
    }

    @discardableResult
    private func pinConstraint(
        mode: ConstraintMode,
        _ firstConstraint: NSLayoutDimension,
        _ secondConstraint: NSLayoutDimension,
        multiplier: Double = 1
    ) -> NSLayoutConstraint {
        let mult = CGFloat(multiplier)
        let result: NSLayoutConstraint
        translatesAutoresizingMaskIntoConstraints = false
        switch mode {
        case .equal:
            result = firstConstraint.constraint(equalTo: secondConstraint, multiplier: mult)
        case .grOE:
            result = firstConstraint.constraint(greaterThanOrEqualTo: secondConstraint, multiplier: mult)
        case .lsOE:
            result = firstConstraint.constraint(lessThanOrEqualTo: secondConstraint, multiplier: mult)
        }

        result.isActive = true
        return result
    }

    @discardableResult
    private func pinDimension(
        mode: ConstraintMode,
        _ dimension: NSLayoutDimension,
        constant: Double
    ) -> NSLayoutConstraint {
        let const = CGFloat(constant)
        let result: NSLayoutConstraint
        translatesAutoresizingMaskIntoConstraints = false
        switch mode {
        case .equal:
            result = dimension.constraint(equalToConstant: const)
        case .grOE:
            result = dimension.constraint(greaterThanOrEqualToConstant: const)
        case .lsOE:
            result = dimension.constraint(lessThanOrEqualToConstant: const)
        }

        result.isActive = true
        return result
    }
}
