
cp ContentDelivery/AWSContentManager.h AWSContentManager.h
cp CloudLogic/AWSCloudLogic.h AWSCloudLogic.h
cp Identity/AWSIdentityManager.h AWSIdentityManager.h
cp Push/AWSPushManager.h AWSPushManager.h
cp SignIn/AWSFacebookSignInProvider.h AWSFacebookSignInProvider.h
cp SignIn/AWSGoogleSignInProvider.h AWSGoogleSignInProvider.h
cp SignIn/AWSSignInProvider.h AWSSignInProvider.h
cp UserFiles/AWSUserFileManager.h AWSUserFileManager.h

jazzy --objc \
      --umbrella-header AWSMobileHubHelper.h \
      --framework-root . \
      --sdk iphoneos \
      --output docs/objc_output

rm AWSContentManager.h
rm AWSCloudLogic.h
rm AWSIdentityManager.h
rm AWSPushManager.h
rm AWSFacebookSignInProvider.h
rm AWSGoogleSignInProvider.h
rm AWSSignInProvider.h
rm AWSUserFileManager.h