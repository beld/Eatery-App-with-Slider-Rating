<br>

![Banner](Resources/Banner.png)

<br>

Create beautiful, customizable, extendable, animated checkboxes on iOS. Completely configurable through interface builder. It has several built in animations, custom value support, a mixed state, checkmark and radio styles, circular and rounded rectangle box shapes, as well as full color customization. See the demo app to play with all the features. 

##Table of Contents

* [**Recent Changes**](#recent-changes)
* [**Documentation**](#documentation) 
    * [Animations](#animations)
    * [Values](#values)
    * [State](#state)
    * [Appearance](#appearance)
* [**Getting Started**](#getting-started)
    * [Installation](#installation)
    * [Use](#use)
* [**Project Structure**](project-structure)
* [**Project Details**](project-details)
    * [Requirements](requirements)
    * [Support](support)
    * [Todo](todo)
    * [License](license)


##Recent Changes

- **2.0.0:** M13Checkbox is now implemented in swift! The checkbox has been redone from scratch.
    - **Added:** 
        - Animations
    - **Removed:** 
        - Gloss overlay
        - Title label: This is very easy to achieve with auto-layout. It is no longer necessary to be provided by the library. This may be re-implemented in a later release.
        - Custom checkboxes


##Documentation

Check out the demo app to change the properties of the checkbox and see the changes in real time.

### Animations

- **Animation `enum`:** The possible animations for switching to and from the unchecked state.
    - **Stroke:**
    
        ![Stroke Sample](Resources/Samples/Stroke Sample.gif)
    - **Fill:**
    
        ![Fill Sample](Resources/Samples/Fill Sample.gif)
    - **Bounce (Stroke):**
    
        ![Bounce Stroke Sample](Resources/Samples/Bounce Stroke Sample.gif)
    - **Bounce (Fill):**
    
        ![Bounce Fill Sample](Resources/Samples/Bounce Fill Sample.gif)
    - **Expand (Stroke):**
    
        ![Expand Stroke Sample](Resources/Samples/Expand Stroke Sample.gif)
    - **Expand (Fill):**
    
        ![Expand Fill Sample](Resources/Samples/Expand Fill Sample.gif)
    - **Flat (Stroke):**
    
        ![Flat Stroke Sample](Resources/Samples/Flat Stroke Sample.gif)
    - **Flat (Fill):**
    
        ![Flat Fill Sample](Resources/Samples/Flat Fill Sample.gif)
    - **Spiral:**
    
        ![Spiral Sample](Resources/Samples/Spiral Sample.gif)
    - **Fade (Stroke):**
    
        ![Fade Stroke Sample](Resources/Samples/Fade Stroke Sample.gif)
    - **Fade (Fill):**
    
        ![Fade Fill Sample](Resources/Samples/Fade Fill Sample.gif)
    - **Dot (Stroke):**
    
        ![Dot Stroke Sample](Resources/Samples/Dot Stroke Sample.gif)
    - **Dot (Fill):**
    
        ![Dot Fill Sample](Resources/Samples/Dot Fill Sample.gif)
- **stateChangeAnimation `Animation`:** The type of animation to preform when changing from the unchecked state to any other state.
- **animationDuration `NSTimeInterval`:** The duration of the animation that occurs when the checkbox switches states. The default is 0.3 seconds.

### Values
    
- **value `(Any)`:** Returns either the `checkedValue`, `uncheckedValue`, or `mixedValue` depending on the checkbox's state.
- **checkedValue `Any`:** The object to return from `value` when the checkbox is checked.
- **uncheckedValue `Any`:** The object to return from `value` when the checkbox is unchecked.
- **mixedValue `Any`:** The object to return from `value` when the checkbox is mixed.

### State

- **CheckState `enum`:** The possible states the check can be in.
    - **Unchecked:** No check is shown.
    - **Checked:** A checkmark is shown.
    - **Mixed:** A dash is shown.
- **checkState `CheckState`:** The current state of the checkbox.
- **setCheckState(newState: `CheckState`, animated: `Bool`):** Change the check state with the option of animating the change.
- **toggleCheckState(animated: `Bool` = false):** Toggle the check state between `Unchecked` and `Checked` states.

### Appearance

- **MarkType:** The possible shapes of the mark.
    - **Checkmark:** The mark is a standard checkmark.
    - **Radio:** The mark is a radio style fill.
- **BoxType:** The possible shapes of the box.
    - **Circle:** The box is a circle.
    - **Square:** The box is square with optional rounded corners.
- **tintColor:** The main color of the `Selected` and `Mixed` states for certain animations. 
- **secondaryTintColor `UIColor`:** The color of the box in the unselected state.
- **secondaryCheckmarkTintColor `UIColor`:** The color of the checkmark or radio for certain animations. (Mostly animations with a fill style.)
- **checkmarkLineWidth `CGFloat`:** The line width of the checkmark.
- **markType `MarkType`:** The type of mark to display.
- **boxLineWidth `CGFloat`:** The line width of the box.
- **cornerRadius `CGFloat`:** The corner radius of the box if the box type is `Square`.
- **boxType `BoxType`:** The shape of the checkbox.
- **hideBox `Bool`:** Wether or not to hide the box.


<br>

##Getting Started

### Installation

#### Cocoapods

The easiest way to install M13Checkbox is through CocoaPods. Simplify add the following to your podfile.

```
pod 'M13Checkbox'
```

#### Carthage

To install via Carthage, add the following to your cartfile:

```
github "Marxon13/M13Checkbox"
```

#### Swift Package Manager

To install via Swift Package Manager, add the following as a dependency to your Package.swift file:

```
.Package(url: "git@github.com:Marxon13/M13Checkbox.git", versions: Version(2,0,0)..<Version(2,0,0)),
```

#### Manual

Another option is to copy the files in the "Sources" folder to your project.

### Use

#### Storyboard

Add a custom view to the storyboard and set its class to "M13Checkbox". Customize the available parameters in the attributes inspector as needed.

**Note:** A shim was added to add support for setting enum properties through interface builder. Just retrieve the integer value corresponding to the enum value needed, and enter that into the property in the attributes inspector.

#### Programmatically 

Just initialize the checkbox like one would initialize a UIView, and add it as a subview to your view hierarchy. 

```
let checkbox = M13Checkbox(frame: CGRect(x: 0.0, y: 0.0, width: 40.0, height: 40.0)
view.addSubview(checkbox)
```

<br>


##Project Structure

**M13Checkbox**
The main interface for M13Checkbox is the `M13Checkbox` class. It is a subclass of `UIControl` and handles the configurable properties, as well as touch events. 

**M13CheckboxManager**
Each `M13Checkbox` references an instance of `M13CheckboxManager`, which controls the appearance and animations of its layers. The manager passes a set of layers to the `M13Checkbox`, which adds the layers to its layer hierarchy. The checkbox then asks the manager to perform the necessary animations on the layers to animate between states. Each animation type has its own subclass of `M13CheckboxManager`. To add an animation, subclass `M13CheckboxManager`, and add the animation type to the `Animation` enum, supporting the animation `Style` if applicable. Take a look at the existing managers to see what variables and functions to override.

**M13CheckboxAnimationPresets**
Each `M13CheckboxManager` references an instance of `M13CheckboxAnimationPresets`, which generates the animations that will be applied to layers during state transitions. The base class contains animations that are shared between multiple animation styles. An animation can subclass `M13CheckboxAnimationPresets` to generate new animations specific to the animation type.

**M13CheckboxPathPresets**
Each `M13CheckboxManager` references an instance of `M13CheckboxPathPresets`, which generates the paths that will be displayed by the layers. The base class contains paths that are shared between multiple animation styles, as well as some boilerplate code to determine which path to use. Some animations have a subclass of `M13CheckboxPathPresets` to add new paths specific to the animation type, or override existing paths to customize the look.

`M13CheckboxPathPresets` calculates the positions of the points of the checkmark with more than just a basic scaled offset. This allows the checkmark to always look the same, not matter what size the checkbox is. The math contained in the `checkmarkLongArmBoxIntersectionPoint` and `checkmarkLongArmEndPoint` are a simplified version of a human readable solution. To see the math that went into creating these equations, check out the "Math.nb" or the "Math.pdf" in the "Other" folder.

**M13Checkbox+IB**
A shim that gives the ability to set the enum values of `M13Checkbox` in Interface Builder.

<br>

##Project Details

### Requirements

- Requires iOS 9 or later.
- Requires Swift 2.2

### Support

Open an issue or shoot me an email. Check out previous issues to see if your's has already been solved. (I would prefer an issue over an email. But will still happily respond to an email.)

### Todo

- Possibly change enumeration values to strings?
- Fix the animations between the checked and mixed states when the mark is a radio. When the circle is close to being flat, the left and right edges are not rounded, as well as render some artifacts. 
- Add visual feedback for UIControl's selected state. So that when the checkbox is touched, it animates slightly towards the new state.
- Add support for interrupting animations mid-animation. So that if the checkbox is tapped multiple times in quick succession, it animates from the current values, instead of resetting the checkbox and restarting the animations. This might involve replacing CAAnimations with manually done animations using a CADisplayLink.
- tvOS support.
- watchOS support.
- Mac OS X support.
- Checkbox cells (Re-add label support)
- Checkbox groups (single / multiple selection)

### License

***Available Under the MIT License***

>Copyright (c) 2016 Brandon McQuilkin
>                    
>Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:
                    
>The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.
                    
>THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.





