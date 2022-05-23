//
//  AlertForView.swift
//  TripReview
//
//  Created by Саид on 23.05.2022.
//

import UIKit

extension UIViewController {
    func createAlert(_ title: String, _ message: String, _ titleForAction: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let confirmAction = UIAlertAction(title: titleForAction, style: .default, handler: nil)
        alert.addAction(confirmAction)
        self.present(alert, animated: true, completion: nil)
    }
}
