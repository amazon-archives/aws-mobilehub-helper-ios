# AWS Mobile Hub Helper for iOS

The AWS Mobile Hub simplifies the process of building, testing, and monitoring mobile applications that make use of one or more AWS services. It helps you skip the heavy lifting of integrating and configuring services by letting you add and configure features to your apps, including user authentication, data storage, backend logic, push notifications, content delivery, and analytics—all from a single, integrated console.

This helper code is the source for the AWSMobileHubHelper.framework file which is included with every Objective C and Swfit application download from AWS Mobile Hub. 

* [API Docs](https://docs.aws.amazon.com/awsmobilehubhelper/apireference/latest/index.html)
* [Forums](https://forums.aws.amazon.com/forum.jspa?forumID=88)
* [Issues](https://github.com/aws/aws-mobilehub-helper-ios/issues)

## Distribution

You can download the framework along with the sample app from the mobile hub [console](https://console.aws.amazon.com/mobilehub) under the build section. The framework is currently distributed as a static library.

## Building framework from source

You can build the framework from source using the [Script](Scripts/GenerateHelperFramework.sh). The API reference documentation can be generated using the [Script](Scripts/GenerateHelperFrameworkDocs.sh).

## Submitting Pull Requests

At this time we are accepting pull requests only for Bug fixes (one bug per requests). For new features please submit feedback on the [mobile hub console](https://console.aws.amazon.com/mobilehub/home) (link for feedback on the bottom left corner). Please make sure that your pull requests comply with the license.