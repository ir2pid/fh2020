# Officerr
https://www.youtube.com/watch?v=AitY93Gb5Gg


Flutter Hackthon 2020 https://flutterhackathon.com/#/


## Contributors

Our team consists of members from Angola, India, Germany, Rwanda, and Vietnam. Some team members have relocated to countries such as Brazil, Finland, Germany, and Ireland. We joined forces online the night before the Hackathon, combining our skills and passion for developing from around the globe.

Pedro Massango
https://github.com/pedromassango

Brian Kummer
https://github.com/briaini

Sudipta Dutta
https://github.com/ir2pid

Hung Nguyen
https://github.com/Harrisonnguyen1210

Mahoro Pierratono Costa
https://github.com/pierratonoc

## About

The purpose of our app is, from a humanitarian perspective, to save the planet. It addresses police brutality, an issue that has unfortunately been present since the beginning of policing and is finally gaining serious public attention during the timeframe of this pandemic. The idea of the app is to harness the power of mobile technology to record, report, and share peoples' interactions with police in order to draw attention to heinous acts as well as recognize police officers responsibly upholding their duties. With the chaotic nature of news, along with occasionally short-lived news cycles, some occurrences unfortunately do not receive the public attention that they should or are quickly forgotten. Officerr confronts these issues in a manner that unites society by leading to more accountable policing and rebuilding trust between all.
A user may upload a story, a previously captured image or video, or an image or video captured through the app. These posts are uploaded to a public repository. Users may search, filter and view these posts with the intention being for them to leave a review of the interaction. This review aggregator allows for people to participate in drawing attention to cases of interest. This increased attention as well as not only seeing the good and bad, but having a centrally located, easily navigable history to look back on will provide pressure to make necessary systemic changes.

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
Move or copy ```GoogleService-Info.plist``` into the ```[my_project]/ios/Runner``` directory.
Open Xcode, then right-click on Runner directory and select Add Files to "Runner".
Select GoogleService-Info.plist from the file manager.
A dialog will show up and ask you to select the targets, select the Runner target.
Then add the CFBundleURLTypes attributes below into the [my_project]/ios/Runner/Info.plist file.
```
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
```
