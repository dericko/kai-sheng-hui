# Kai Sheng Hui

### Application Spec:
- iOS: 7.1+
- Xcode: 5.1.1
- Version Control: git
- Remote: https://www.github.com/derick/kai-sheng-hui
- Branches: master, development(dataModelDevelopment, networkingDevelopment, viewDevelopment)

### Description:
iOS Application for 凯盛汇 platform. A multiple-function hub for Capvision Experts.
- check and share news curated for user's industry and interests with offline reading
- check current project and event status in real time
- browse project opportunities
- browse upcoming events
- check other member items related to KSH profile

## Structure:

### Networking
- __Object Managers__ wrap Restkit to handle all API requests and responses
- __Mapping Provider__ - a factory class that maps JSON to Core Data entities in app
### Model
- Entities defined in xcdatamodeld file
- MOGenerator subclasses (Can edit 'EntityName', cannot edit '_EntityName')


## Libraries/Dependencies: (managed by CocoaPods, see Podfile)

### MOGenerator - builds editable subclasses for Core Data class customization (requires separate installation)


### RestKit 0.20.00 - used for networking

### TSMessages - top and bottom messages