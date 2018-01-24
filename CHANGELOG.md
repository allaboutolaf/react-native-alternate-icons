## 0.4.7
- Remove rejections on getIconName and reset() on Android

## 0.4.6
- Remove many of the `rejects` that would happen when functions were called on old iOS versions
- Return "default" from getIconName when alternate icons are unavailable

## 0.4.5
- Ensure that we run on the main thread, because iOS requires it

## 0.4.4
- Fixed module exporting

## 0.4.3
- Fixed reworked API to use the RCT\_\* things correctly

## 0.4.2
- More doc updates

## 0.4.1
- Updated README; added CHANGELOG

## 0.4.0

- First release under my fork while I try to figure out what to upstream
- Reworked the API of the module to use promises
- Renamed `supportDevice` to `isSupported`
