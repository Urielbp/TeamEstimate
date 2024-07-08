# Team Estimate

![Static Badge](https://img.shields.io/badge/Xcode-15-blue)


This iOS App helps teams create estimates using Planning Poker. It currently supports two modes: 
- Fibonacci.
- T-Shirt size.

# How to run

To run the iOS App, follow these steps:

1. Clone the repository: `git clone https://github.com/Urielbp/TeamEstimate.git`
2. Open `TeamEstimate.xcodeproj`
3. Build and run the app on a simulator or a physical device.
> The App is available in English using the `TeamEstimate EN` scheme and in Brazilian Portuguese using the `TeamEstimate PT-BR` scheme.

## Features

- Accessibility: Resizable text size according to user preferences.
- Accessibility: Dark mode support.
- Localization: The app is available in English (EN-US) and Brazilian Portuguese (PT-BR).
- MVVM-C architectural pattern.

## Future improvements

- Improve the user interface to make the iPad experience more intuitive and friendly.
- Localization: Support to more languages.
-  Migration to SwiftUI:
    - TipKit: SwiftUI is recommended to fully utilize [TipKit](https://developer.apple.com/documentation/tipkit)'s capabilities.
    - Combine: [Combine](https://developer.apple.com/documentation/combine) provides a reactive approach that makes view models more concise.
- XcodeGen: [XcodeGen](https://github.com/yonaskolb/XcodeGen) or another project generation tool is recommended when collaborating with more people.
- Swiftlint: Enforces a common coding style for all the team.
- Firebase integration: Analytics and data integration.
- Xcode Cloud: CI/CD pipeline integration with native Xcode cloud.
