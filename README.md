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

### Background
This is the initial version of 凯盛汇 (Kai Sheng Hui) for iOS, which I wrote in summer 2014 during an internship at Capvision in Shanghai. It is a RestKit and Core Data REST client that fetches and persists data on the local device. This version uses a Parse.com database and API (setup in KSHObjectManger.h), as the official KSH API is still in development. This project will be completed in Q4 2014 by a full-time developer, but will not be posted to this repo. I hope to use some of the networking code and RestKit-Core Data structure in future projects and tutorials (as I was unable to find much information for many of the problems that I had to figure out in this project).

I have done my best to separate responsibilities according to MVC+networking with four areas:
- Model: _Entities_ are setup xcdatamodeld file. Subclasses are handled by MOGenerator (Can edit 'EntityName', cannot edit '_EntityName'). Basic transformations (data<->images, enums->strings), as well as the [KSHUser currentUser] singleton are handled in subclasses.
- Networking: _Object Managers_ to make API calls, set request and response parameters/headers, and immediately map responses to Core Data entities according to dictionaries in the _Mapping Provider_. Requests and entity relationship setup are handled by object managers (ContentManger for Articles/ProjectOpps/Events & UserManager for login stuff and user-ownded stuff like Projects/Tasks).
- Controllers: View Controllers are only allowed to start requests via _Object Managers_ and to fetch data from the persistent store to update views. 
- Views: Some subclasses for tableViewVells and toolbars, but mostly used storyboards

Testing - I began to setup Restkit-based network/mapping tests, but completely abandoned the effort. Fail :(

### Libraries/Dependencies: (managed by CocoaPods, see Podfile)
- MOGenerator - Mogenerator Target runs script at build-time. Requires separate installation/setup (if you want automatic mogeneration...which you do)
- RestKit 0.20.00 - plus its sub-dependencies (AFNetworking 1, some other stuff)
- TSMessages - prettier notifications, not at all necessary