fastlane documentation
================
# Installation

Make sure you have the latest version of the Xcode command line tools installed:

```
xcode-select --install
```

Install _fastlane_ using
```
[sudo] gem install fastlane -NV
```
or alternatively using `brew install fastlane`

# Available Actions
## iOS
### ios firebase_distribute_staging
```
fastlane ios firebase_distribute_staging
```
Firebase distribute staging
### ios firebase_distribute_debug
```
fastlane ios firebase_distribute_debug
```
Firebase distribute debug
### ios firebase_distribute_internal
```
fastlane ios firebase_distribute_internal
```
Firebase distribute internal
### ios firebase_distribute_release
```
fastlane ios firebase_distribute_release
```
Firebase distribute release
### ios firebase_distribute_no_increment_staging
```
fastlane ios firebase_distribute_no_increment_staging
```
Firebase distribute staging
### ios firebase_distribute_no_increment_debug
```
fastlane ios firebase_distribute_no_increment_debug
```
Firebase distribute debug
### ios firebase_upload_current_build_staging
```
fastlane ios firebase_upload_current_build_staging
```
Firebase upload current build staging
### ios firebase_upload_current_build_production
```
fastlane ios firebase_upload_current_build_production
```
Firebase upload current build production
### ios firebase_distribute_no_increment_internal
```
fastlane ios firebase_distribute_no_increment_internal
```
Firebase distribute internal
### ios firebase_distribute_no_increment_release
```
fastlane ios firebase_distribute_no_increment_release
```
Firebase distribute release
### ios testflight_distribute_staging
```
fastlane ios testflight_distribute_staging
```
TestFlight Staging
### ios testflight_distribute_internal
```
fastlane ios testflight_distribute_internal
```
TestFlight Internal
### ios testflight_distribute_release
```
fastlane ios testflight_distribute_release
```
TestFlight Release
### ios appstore_distribute_release
```
fastlane ios appstore_distribute_release
```
AppStore release
### ios run_all_tests
```
fastlane ios run_all_tests
```
Run tests
### ios match_appstore_connect
```
fastlane ios match_appstore_connect
```
match appstore connect

----

This README.md is auto-generated and will be re-generated every time [_fastlane_](https://fastlane.tools) is run.
More information about fastlane can be found on [fastlane.tools](https://fastlane.tools).
The documentation of fastlane can be found on [docs.fastlane.tools](https://docs.fastlane.tools).
