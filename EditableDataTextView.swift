//
//  EditableDataTextView.swift
//  Created by Patrick Veilleux on 3/20/20.
//

import UIKit

/// A subclass of UITextView that allows data detection and editing capabilities.
class EditableDataTextView: UITextView {

    /// A tap gesture recognizer to activate the editing of the text view. Upon
    /// receiving a tap `isEditable` will be set to `true` and the text view will
    /// call `becomeFirstResponder()`.
    private var tapRecognizer: UITapGestureRecognizer!
    
    /// A Boolean value indicating whether the receiver is editable.
    ///
    /// Overrides the default property to invert the `isEnabled` status of
    /// `tapRecognizer` from `isEnabled`. Set this to `false` when the user is
    /// done editing so the data detection is enabled.
    override var isEditable: Bool {
        didSet {
            tapRecognizer?.isEnabled = !isEditable
        }
    }

    override init(frame: CGRect, textContainer: NSTextContainer?) {
        super.init(frame: frame, textContainer: textContainer)
        setupTapRecognizer()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupTapRecognizer()
    }

    /// Creates `tapRecognizer` and adds it to the view.
    private func setupTapRecognizer() {
        if tapRecognizer == nil {
            tapRecognizer = UITapGestureRecognizer(target: self, action: #selector(textViewTapped(recognizer:)))
            tapRecognizer.numberOfTapsRequired = 1
            addGestureRecognizer(tapRecognizer)
            
            isEditable = false
            dataDetectorTypes = .all
        }
    }

    /// Sets `isEditable` to true and calls `becomeFirstResponder()`. Moves the
    /// cursor to the closest location within the text in relation to the location
    /// of the tap.
    @objc private func textViewTapped(recognizer: UITapGestureRecognizer) {
        isEditable = true
        becomeFirstResponder()

        let point = recognizer.location(in: self)
        let position = closestPosition(to: point) ?? UITextPosition()
        self.selectedTextRange = textRange(from: position, to: position)
    }
}