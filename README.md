# hacking-with-swift
My 39 projects from the Hacking with Swift Tutorials (4/39)


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
