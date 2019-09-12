# hacking-with-swift
My 39 projects from the Hacking with Swift Tutorials (9/39), challenges included!


39 different projects from the Hacking with Swift website. https://www.hackingwithswift.com/read/


# The main concepts covered and learned in each project:

## Project1:
 * Using `FileManager` to grab and list images
 * Designing a UI using Interface Builder
 * Loading images using `UIImage`
 
## Project2:
 * Introduction to `CALayer` and using this to change certain aspects of the button layers
 * Accessing and using random integers
 * Creating and using `IBOutlets` and `IBActions`

## Project3 (a 'technique' lesson and modification of Project1):
 * Introduction to `UIActivityViewController`
 * Using `UIActivityViewController` to share photos on social media or save it to the device
 * Accessing the `Info.plist` file and enabling 'Privacy - Photo Library Additions Usage Description' in order to provide the user with a way to give the app permission to save the photo to the device.

## Project4:
 * Introduction to `WebKit`
 * Introduction to `UIToolbar`
 * Introduction to `UIProgressView`
 * Creating a simple web broswer using `WKWebView`
 * Using `UIAlertController` as an action sheet that lists the websites the user can choose from
 * Create a `UIToolbar` and use `UIBarButtonItem` in order to display the page loading progress as well as a refresh button. 
 * Using `addObserver` on the webView's `estimatedProgress` in order to know when the progress of loading the web page has changed.
 * Using `observeValue` in order to tell the app what to do when the `estimatedProgress` key has a change in value. Resulting in updating our custom `progressView` with the new value.
 
 ## Project5:
 * A simple anagram game
 * Reload `UITableView` data and insert rows into sections
 * Add text fields to `UIAlertController` using `.addTextField()`
 * Use of closures
 * How to avoid _strong referencing_ when using closures
 * Use of _trailing closure syntax_ in Swift

 ## Project6:
 * Auto Layout introduction
 * Visual Formatting Language (VFL) introduction
 * Use of `addConstraints` with VFL
 * Use of metrics and priorities with `constraints(withVisualFormat:)`
 * Creating programmatic constraints and anchors
 
  ## Project7:
 * Download JSON using Swift's `Data` type
 * Use the `Codable` protocol to convert data into a Swift object
 * Insert custom HTML into a `WebView` and use the custom data to render as dynamic elements
 * Use the decoded JSON as the data for the `tableView` and `DetailViewController`
 * Filter the petitions via a search feature and customize the `tableView` data based on whether a user has made a search or not

## Project8:
 * Create a `UIKit` based game built from programmatic UI elements
 * Use of `addTarget()` on `UIButton` elements
 * Basic use of Property Observers to update the state of the user interface
 * Create the game answers and hints by using `components(separatedBy:)` on the game data which is located on the main bundle and accessed via `path(forResource:ofType:)`
 * Check the users answer with the correct answer using `firstIndex(of:)` on the array of solutions
