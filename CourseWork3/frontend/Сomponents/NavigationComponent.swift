//
//  NavigationComponent.swift
//  CourseWork3
//
//  Created by Алиса Вышегородцева on 07.12.2022.
//

import UIKit

class NavigationController : UINavigationController {
    
    private func configureItems(){
        let backButtonBackgroundImage = UIImage(named: "back_svg")
        let barAppearance =
            UINavigationBar.appearance(whenContainedInInstancesOf: [CustomBackButtonNavController.self])
        barAppearance.backIndicatorImage = backButtonBackgroundImage
        barAppearance.backIndicatorTransitionMaskImage = backButtonBackgroundImage

        // Nudge the back UIBarButtonItem image down a bit.
        let barButtonAppearance =
            UIBarButtonItem.appearance(whenContainedInInstancesOf: [CustomBackButtonNavController.self])
        barButtonAppearance.setBackButtonTitlePositionAdjustment(UIOffset(horizontal: 0, vertical: -5), for: .default)
    }
}
