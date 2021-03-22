AppcentNews is a news feed application that I developed for Appcent. From this application you can view the news according to the word you are searching, 
access the news sources and add the news you want to your favorites.

This app uses **News API**. - https://newsapi.org/

### 3rd Party Libraries
**Alamofire**, **SwiftlyJSON** and **SDWebImage/SDWebImageSwiftUI**

### Features

* Search for news that contains the word you want.
* Add news to your favorites.
* Access the source, date, details and author of the news that interests you.

### Architecture

The application's design pattern is the **MVVM** model that comes built-in with Apple's SwiftUI Framework.

#### Models
* `NewsDataModel` is the data container of the news. Which is a **Model** for this application.

#### ViewModels
* `NewsAPIGet`, `NewsWebViewModel`, `ShareViewModel` and `FavoritesViewModel` files are the **ViewModel**'s. 
* These files encapsulate business logic and allow Views to observe state changes.
* NewsAPIGet retrieves the results of the searched word and sends it to the NewsListView.
* NewsWebViewModel creates the model of the page that opens when the news feed is clicked.
* ShareViewModel creates the opened sheet to share the url of the news link.
* FavoritesViewModel retrieves the pre-saved news stored in storage and passes it to the favorites view.

#### Views
* `NewsDetailView`, `NewsListView`, `NewsWebView` and `FavoritesView` files are my **View**'s.
* `NewsListView` is the view where news are listed. You can search news here and also load more news as you scroll the page.
* In `NewsDetailView`, you can see the details of the news you clicked from the news list.
* `NewsWebView` shows you the source page of the news
* In `FavoritesView`, you can see the list of the news you have added to your favorites.

