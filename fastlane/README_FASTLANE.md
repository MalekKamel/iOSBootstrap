fastlane documentation
================

# Firebase Distribution

|    **Configuration**      |                        **Command**                     |
| ------------------------- | -------------------------------------------------------| 
|       Staging             |   bundle exec fastlane firebase_distribute_staging     |
|       Debug               |   bundle exec fastlane firebase_distribute_debug       | 
|       Internal            |   bundle exec fastlane firebase_distribute_internal    |
|       Release             |   bundle exec fastlane firebase_distribute_release     |

The previous commands increment the version code automatically.
If you don't need to increment the version, use the following instead

|    **Configuration**      |                        **Command**                                  |
| ------------------------- | --------------------------------------------------------------------| 
|       Staging             |   bundle exec fastlane firebase_distribute_no_increment_staging     |
|       Debug               |   bundle exec fastlane firebase_distribute_no_increment_debug       | 
|       Internal            |   bundle exec fastlane firebase_distribute_no_increment_internal    |
|       Release             |   bundle exec fastlane firebase_distribute_no_increment_release     |

# TestFlight Distribution

|    **Configuration**      |                        **Command**                       |
| ------------------------- | ---------------------------------------------------------| 
|       Staging             |   bundle exec fastlane testflight_distribute_staging     |
|       Debug               |   bundle exec fastlane testflight_distribute_debug       | 
|       Internal            |   bundle exec fastlane testflight_distribute_internal    |
|       Release             |   bundle exec fastlane testflight_distribute_release     |

# App Store Distribution

|    **Configuration**      |                        **Command**                   |
| ------------------------- | -----------------------------------------------------|
|       Release             |   bundle exec fastlane appstore_distribute_release   |

# Synchronizing Certificates & Provisioning Profiles

#### The First Time

fastlane match  appstore
fastlane match  development

#### In new machines:

fastlane match --readonly  appstore
fastlane match --readonly  development

# GymFile

to create `Gymfile`, run in terminal `fastlane gym init`.

# Common Error

If you encounter error `Unable to locate Xcode. Please make sure to have Xcode installed on your machine`
run this in terminal `sudo xcode-select -switch /Applications/Xcode.app/Contents/Developer`.