# Officerr

A new Flutter project.

## Getting Started

The project uses google signin. Please update the googleservices json and plist for iOS and android respectively to be able to use the app.

### Instructions:
#### Android integration 
To access Google Sign-In, you'll need to make sure to register your application.

You don't need to include the google-services.json file in your app unless you are using Google services that require it. You do need to enable the OAuth APIs that you want, using the Google Cloud Platform API manager. For example, if you want to mimic the behavior of the Google Sign-In sample app, you'll need to enable the Google People API.

Make sure you've filled out all required fields in the console for OAuth consent screen. Otherwise, you may encounter APIException errors.

#### iOS integration 
First register your application.
Make sure the file you download in step 1 is named GoogleService-Info.plist.
Move or copy GoogleService-Info.plist into the [my_project]/ios/Runner directory.
Open Xcode, then right-click on Runner directory and select Add Files to "Runner".
Select GoogleService-Info.plist from the file manager.
A dialog will show up and ask you to select the targets, select the Runner target.
Then add the CFBundleURLTypes attributes below into the [my_project]/ios/Runner/Info.plist file.
<!-- Put me in the [my_project]/ios/Runner/Info.plist file -->
<!-- Google Sign-in Section -->
<key>CFBundleURLTypes</key>
<array>
	<dict>
		<key>CFBundleTypeRole</key>
		<string>Editor</string>
		<key>CFBundleURLSchemes</key>
		<array>
			<!-- TODO Replace this value: -->
			<!-- Copied from GoogleService-Info.plist key REVERSED_CLIENT_ID -->
			<string>com.googleusercontent.apps.861823949799-vc35cprkp249096uujjn0vvnmcvjppkn</string>
		</array>
	</dict>
</array>
<!-- End of the Google Sign-in Section -->