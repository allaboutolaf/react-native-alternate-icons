# react-native-alternate-icons
React Native Alternate Icons for iOS 10.3+

## Requirements
* React Native 0.44+ (only tested on 0.44)

## Installation

```bash
npm install @hawkrives/react-native-alternate-icons@latest --save
```

## Link the library to your React Native project

```bash
react-native link
```

#### Manual Linking

https://facebook.github.io/react-native/docs/linking-libraries-ios.html

## Preparation & Code Sample

### Preparation

#### Add your icons into your Xcode Project
![Icons in your Xcode Project](http://kamsteegsoftware.nl/react-native-alternate-icons/icons-project.png)

#### Add the following code to your info.plist
```xml
<key>supportsAlternateIcons</key>
<true/>
<key>CFBundleIcons</key>
<dict>
  <key>CFBundlePrimaryIcon</key>
  <dict>
    <key>CFBundleIconFiles</key>
    <array>
      <string>icon_filename</string>
    </array>
    <key>UIPrerenderedIcon</key>
    <true/>
  </dict>
  <key>CFBundleAlternateIcons</key>
  <dict>
    <key>icon_type_alternate_name</key>
    <dict>
      <key>CFBundleIconFiles</key>
      <array>
        <string>alternate_icon_filename</string>
      </array>
      <key>UIPrerenderedIcon</key>
      <true/>
    </dict>
  </dict>
</dict>
```

#### Using in your React Native applications
- `setIconName(name: string): Promise<void>` – takes one of the icon "names" defined in your Info.plist (`icon_type_alternate_name`, in the example above)
- `getIconName(): Promise<string>` – returns the current icon's name
- `reset(): Promise<void>` – resets the icon to the default bundle icon
- `isSupported(): Promise<boolean>` – checks if the current devide is supported. Always returns `false` on Android.

Because these all return promises, you can use them with ES2016's async/await syntax, too!

For example, you can import all of the functions as a namespace:

```js
import * as Icons from '@hawkrives/react-native-alternate-icons';

await Icons.setIconName(iconName);
```

or import just one or two of them:

```js
import {getIconName} from '@hawkrives/react-native-alternate-icons';

await getIconName();
```
