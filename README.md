## Hint: 
The x-api-key is not added to the repository for security reasons, so it has to be added manually in **`ServerCommunication.swift`** in both projects

# bonprix Coding Challenge

These are two sample iOS-Projects solutions for the bonprix-Code-Challenge including `devlogs` for both approaches
- an `UIKit` Version similar to the example gif
- a `SwiftUI` similar to the style of the current app in the AppStore

 <br>

 UIKit
====
- basic configuration: set `iOS14` as minimum, disable landscape mode, disable darkmode, remove storyboard and scenedelegates for programmatically UI
- fetch json data via xapikey using postman, save json file local to implement `UI first`
- UI:
    - create a simple TabbarController
    - create a simple HomeController (with a `WKWebview`), AssortmentController (with a `TableView`)
    - create an additional ListViewController for the different categories of the AssortmentController
    - extract Webview logic from HomeController to make it reusable from Assortmentcontroller-Subviews
    - finish WebViewcontroller inluding `Progressview` for the Webview, but without the `UINavbar`, because it's already integrated in the mobile Website view
    - finish AssortmentController with a tableView of UIImages and UILabel overlays
- determine bonprix - Red & Gray Colors for styling & search for `Ubuntu` font used on the Bonprix Website (https://fonts.google.com/specimen/Ubuntu?query=ubuntu) to match the style
- find a way for the searchbar of the Assortmentcontroller to represent the example gif, decision made between Navbar and TableViewHeader
- find a solution for the stretchy `HeaderTableView`, use a well working thirdparty solution and refactor the code for better readability and usability
- add `Resolver` pod and switch to `xcworkspace`
- find a way to remove the header of the Webview by analyzing the App with Charles and Safari Webinspector with no success, so hiding it with Javascript injecting into the WKWebview
- re-add `UINavbar` for the WebviewController with a searchbar and red "bonprix"-text similar to the logo
- refactor code where needed and restyle with bonprix-style
- implement api calls and backend communication
- split more views for more reusability and faster build times
- save apikey in a secure way (by removing it)
- check `build time` (3s on a M1 for a clean build is fine)
- write `Unittests` for the Viewmodels + creating Mocks


### Additional information:
- using no coordinator pattern for simplicity similar to the current bonprix-app in the AppStore



### next todos:
- get better titles for "Zur Übersicht", "Alle Artikel anzeigen" in the Webview, i. e. the general link for every assortment category etc.
- find a solution for dead links, e.g. "XMAS -> Party -> Zur Übersicht"
- use localization for multiple languages
- link navbar in webview areas with the area content itself regarding the title and back button after more interacting with links in the Webview
- ipad improvements

<br>


SwiftUI
====
- same basic coniguration, import json file to implement UI first
- implement SwiftUI-`WebView` via UIViewRepresentable & WebKit + JS-injection for the home page only
- create `TabView` with two new Views: ShopView & AssortmentView
- create ListView with a `List` for all categories & subcategories of the AssortmentView similar to the UIKit version first
- add horizontal swipeable Header-Teaser-View for "Damen", "Herren", etc., add it to the `List`
- add its subentries directly below the teaser in the same `List`
- add horizontal swipeable view (ShopNavigationBar) with maincategory names inbetween also in the `List`
- find a solution for animating the HeaderTeaser and ShopNavigationBar while changing one of them, but without animating the List-entries of the subcategories by duplicating `@Published` values in the view model
- implement custom `AsyncImage` for iOS 14 and its ImageLoader Service
- fetch api data async using `Combine`
- detecting known problems with refreshing the `List` after async data loading -> switch to `ScrollView` with entries instead of a `List`, that also solves the duplicate `@Published` props (-> ViewModel cleanup)
- clean up the AssortmentView and extract its Subviews into separate views
- split more views for more reusability and faster (preview) build times
- extract custom modifiers to prevent duplicate code
- (optional) add some more native views for other parts of the app with focus on functionality
    - simple myBonprix View with a `Login`-Button and some dummy entries
        - simple `LoginView`
    - BasketView with two random shop products, dummy images and some details similar to the current version
    - ProductDetailPage - View reachable from the Basket with some dummy data and interactive size selection 
- check `build time` (2s on a M1 for a clean build is fine)
- cleanup new native views
- write `Unittests` for the Viewmodels + creating Mocks
- create an app icon
- final cleanup both projects, remove unneeded code & optimize api code

UIKit | SwiftUI
--- | --- |
![](UIKit.gif) | ![](SwiftUI.gif)