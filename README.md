# watchlist

App for keeping a watchlist of movies.

![imagen](https://github.com/user-attachments/assets/3ce1005b-91de-43f3-9d0f-0b4a60ad45fb)

## App Design & Architecture

The app is built with clean architecture considerations in mind and follows some of the recommendations in the [Flutter Docs](https://docs.flutter.dev/app-architecture/guide). 

The app structure consists of features, each is divided in three layers: presentation, domain and data, it's similar to this diagram, with some tweaks.

![imagen](https://github.com/user-attachments/assets/1184adfe-7520-479f-9bfe-4f77f977f309)

* For the presentation layer the app uses cubit for state management instead of a view model.
* The domain layer contains models and business logic, I agree with the flutter guidelines in the sense that use cases clases are optional and not necessary for all features.
* The data layer contains repositories and services.

## Working with the repo

Create a `env.json` file following the `env.example.json` provided and replace the token with a valid one.

`flutter run --dart-define-from-file=env.json`
