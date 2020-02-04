# hacking-with-swift
My work on some of the projects from the Hacking with Swift Tutorials (26/39). 


26 different projects from the Hacking with Swift website. https://www.hackingwithswift.com/read/


# The main concepts covered and learned in each project:

## Project1:
 ### * A basic image selector and viewing application
 * Using `FileManager` to grab and list images
 * Designing a UI using Interface Builder
 * Loading images using `UIImage`
 
## Project2:
 ### * A simple `UIKit` based flag guessing game.
 * Introduction to `CALayer` and using this to change certain aspects of the button layers
 * Accessing and using random integers
 * Creating and using `IBOutlets` and `IBActions`

## Project3 (a 'technique' lesson and modification of Project1):
 ### * A modification of Project 1
 * Introduction to `UIActivityViewController`
 * Using `UIActivityViewController` to share photos on social media or save it to the device
 * Accessing the `Info.plist` file and enabling 'Privacy - Photo Library Additions Usage Description' in order to provide the user with a way to give the app permission to save the photo to the device

## Project4:
 ### * A simple `WebKit` project that displays a website based off of a list of URLs
 * Introduction to `WebKit`
 * Introduction to `UIToolbar`
 * Introduction to `UIProgressView`
 * Creating a simple web broswer using `WKWebView`
 * Using `UIAlertController` as an action sheet that lists the websites the user can choose from
 * Create a `UIToolbar` and use `UIBarButtonItem` in order to display the page loading progress as well as a refresh button
 * Using `addObserver` on the webView's `estimatedProgress` in order to know when the progress of loading the web page has changed.
 * Using `observeValue` in order to tell the app what to do when the `estimatedProgress` key has a change in value. Resulting in updating our custom `progressView` with the new value.
 
## Project5:
 ### * A simple anagram game
 * Reload `UITableView` data and insert rows into sections
 * Add text fields to `UIAlertController` using `.addTextField()`
 * Use of closures
 * How to avoid _strong referencing_ when using closures
 * Use of _trailing closure syntax_ in Swift

## Project6:
 ### * Simple label layout using Auto Layout
 * Auto Layout introduction
 * Visual Formatting Language (VFL) introduction
 * Use of `addConstraints` with VFL
 * Use of metrics and priorities with `constraints(withVisualFormat:)`
 * Creating programmatic constraints and anchors
 
## Project7:
 ### * A White House petition viewing application
 * Download JSON using Swift's `Data` type
 * Use the `Codable` protocol to convert data into a Swift object
 * Insert custom HTML into a `WebView` and use the custom data to render as dynamic elements
 * Use the decoded JSON as the data for the `tableView` and `DetailViewController`
 * Filter the petitions via a search feature and customize the `tableView` data based on whether a user has made a search or not

## Project8:
 ### * A `UIKit` game built from programmatic UI elements
 * Use of `addTarget()` on `UIButton` elements
 * Basic use of Property Observers to update the state of the user interface
 * Create the game answers and hints by using `components(separatedBy:)` on the game data which is located on the main bundle and accessed via `path(forResource:ofType:)`
 * Check the users answer with the correct answer using `firstIndex(of:)` on the array of solutions
 
## Project9:
 ### * A modification of Project 7
 * Understanding why locking the user interface is bad and how to avoid it
 * Introduction to Grand Central Dispatch, `DispatchQueue` and the `async()` function
 * Understanding the four different background queues, their 'quality of service' level and how their tasks are executed: `User Interactive`, `User Initiated`, `Utility`, `Background`
   * The `User Interactive` and `User Initiated` tasks will be executed as quickly as possible regardless of their effect on battery life.
   * The `Utility` tasks will be executed with an objective to keep power efficiency as high as possible without sacrificing too much on performance.
   * The `Background` tasks will be executed with power efficiency as its priority.
   * There is also the `default` queue which is a good general-purpose choice as it executes its tasks with a priority between `user-initiated` and `utility`.
  * Using `DispatchQueue` to run code on the main thread as well as the background threads
  * Using `performSelector(inBackground)` as well as `performSelector(onMainThread)` to again, run code on the main thread as well as the background threads

## Project10:
 ### * An intro into `UICollectionView` and the photo library.
  * Use `UIImagePickerController`, `UUID` and custom classes to create a basic "pick a photo and give it a name" application. 
 
 ## Project11:
  ### * Use `SpriteKit` to create a game similar to 'Plinko'. 
   * Introduced to SpriteKit and the tools used to create a 2D game for iOS.
   * Understand the different anchor points in `UIKit` vs `SpriteKit`.
   * Use of different `SKPhysicBody` types - `circleOfRadius` and `rectangleOf`.
   * Utilize `UITouch` to track and respond to the touch events within the game.
   * Introduced to `SKAction` and used this to add animation to some of the nodes. 
   * Use `SKPhysicsContactDelegate`in order to respond to physics bodies that collide.
   * Use `contactTestBitMask ` and `collisionBitMask` in order to track which nodes produce intersection notifications as well as which nodes can collide with certain types of physics bodies.
   * Use `SKLabelNode` to dynamically update the score.
   * Introduced to `SKEmitterNode` and used it create special effects - such as fire when the ball explodes. 
  
 ## Project12:
  ### * Save persistent data and access it using `UserDefaults`. 
   * Introduced to `UserDefaults` and used the `set` and `object(forKey:)` methods to save and retrieve data from the defaults database.
   
 ## Project13:
  ### * Use Core Image filters and a UISlider to create a simple photo manipulation app. 
   * Use `UIImagePickerController` to import a photo that will be manipulated.
   * Implement `CIContext` and `CIFilter` in order to process images using filters and a `UISlider` to change the intensity of those filters.
   * Use `UIImageWriteToSavedPhotosAlbum` to save the manipulated photo to the photo album.
   
 ## Project14:
  ### * Another `SpriteKit` game! This time, I integrated `SKCropNode` and GCD to create a 'whack-a-mole' type game. 
   * Introduced to `SKCropeNode` and used this to host multiple nodes and produce the effect of a child node going down into a parent node by integrating `SKAction` to actually show and hide the penguins.
   * Introduced to the power of `SKAction.sequence` in order to run a sequence of actions on a node. In this case - we implemented a delay, hid the penguin, and then set its `isVisible` property to `false`. 
