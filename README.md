# EditableDataTextView

A UITextView subclass that allows both editing and data detection.

## Description

I often want UITextView to allow both editing and detection of different types of data within its text property. Both of these features are supported individually so you can have an editable text view that the user can type in and modify and you can have a text view that detects data like phone numbers and links. But having both so that a user can edit, add, and delete text and then have whatever actionable information they’ve added be selectable is not supported natively.

`EditableDataTextView` supports this!

## Getting Started

### Installing

1. Clone this repository or download the ZIP.
2. Copy `EditableDataTextView.swift` into your Xcode project.

### Creating an Instance

Instantiate one the same as you would with `UITextView`.

```swift
let textView = EditableDataTextView()
textView.text = "Hello, World!"
```

Almost everything else is self contained in the class. The only thing you have to do is update `isEditable` when the user is done editing so that data detection and the tap recognizer are enabled again.

```swift
textView.isEditable = false
```
