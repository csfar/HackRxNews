# HackRxNews
HackRxNews is a Hacker News Reader made with the intent of learning Cocoapods and RxSwift.
## Requirements
* iOS 13+
* Xcode 11.x
* Swift 5.x
## Archictecture
HackRxNews is built following `MVVM-C` with a focus on `Dependecy Injection` and `Protocols`. Currently, the `ViewModel`s are doing a lot of work. In the future, a refactor may be done in order to extract away some excess functionality from them.
## Tests and CI
Tests are currently done using `Quick`, `Nimble` and `Nimble-Snapshot`. Every PR or push to master goes through a CI pipeline set up on Bitrise. It checks for linting issues using SwiftLint and runs all tests. If you would like to know more about the CI configuration used in this project, you can check any PR or push with a check to see logs on Bitrise.
## Installation
HackRxNews makes use of Cocoapods for its dependecies. Follow the steps bellow to get project up and running:
1. Install Bundler
```bash
gem install bundler
```
2. Clone the repository.
3. Install Gems
```bash
bundle install
```
4. Install Pods
```bash
bundle exec pod install
```
5. Open the workspace provided by Cocoapods, build and run the project.
## Contact
If you would like to ask anything, whether it be help with something related to the code or you've found a bug, please open an issue.
## License
HackRxNews is lincesed under the MIT License.