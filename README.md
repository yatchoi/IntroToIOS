# Pre-work - Just The Tip

Just The Tip is a tip calculator application for iOS.

Submitted by: Yat Choi

Time spent: 6 hours spent in total

## User Stories

The following **required** functionality is complete:

* [x] User can enter a bill amount, choose a tip percentage, and see the tip and
  total values.
* [x] Settings page to change the default tip percentage.

The following **optional** features are implemented:
* [x] Remembering the bill amount across app restarts (if <10mins)
* [x] Making sure the keyboard is always visible and the bill amount is always
  the first responder. This way the user doesn't have to tap anywhere to use
  this app. Just launch the app and start typing.
* [x] Make a light/dark color scheme
* [ ] Using locale-specific currency and currency thousands separators.
* [ ] UI animations

The following **additional** features are implemented:

* [x] User can change the number of people to split the bill with
* [x] Light/Dark color scheme is saved between app closes
* [x] Keyboard is only initially visible if bill amount is uninitialized from
  a save

## Video Walkthrough

Here's a walkthrough of implemented user stories:

<img src='http://i.imgur.com/j2BZwgW.gif' title='Video
Walkthrough' width='' alt='Video Walkthrough' />

GIF created with [LiceCap](http://www.cockos.com/licecap/).

## Notes

Minor struggles with learning how to access ViewControllers from AppDelegate,
understanding RootController and how NavigationController fits into that.

For some reason, XCode started marking some errors in my SettingsViewController. It is saying that
my UserDefaultHelper class is undefined, even though the code still runs perfectly and clicking
through in the IDE takes me to the currect class. Maybe I accidentally messed up some configuration
somewhere?

## License

    Copyright 2016 Yat Choi

    Licensed under the Apache License, Version 2.0 (the "License");
    you may not use this file except in compliance with the License.
    You may obtain a copy of the License at

        http://www.apache.org/licenses/LICENSE-2.0

    Unless required by applicable law or agreed to in writing, software
    distributed under the License is distributed on an "AS IS" BASIS,
    WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
    See the License for the specific language governing permissions and
    limitations under the License.
