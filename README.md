# NY Times Most Popular Articles

This is a simple Flutter application that hits the NY Times Most Popular Articles API and shows a list of articles, that shows details when items on the list are tapped (a typical master/detail app). We'll be using the most viewed section of this API.

## Libraries Used

This project utilizes the following libraries:

- [provider](https://pub.dev/packages/provider) - for state management
- [cached_network_image](https://pub.dev/packages/cached_network_image) - for image caching
- [shimmer](https://pub.dev/packages/shimmer) - for loading placeholder animations
- [dio](https://pub.dev/packages/dio) - for network requests
- [get_it](https://pub.dev/packages/get_it) - for dependency injection
- [flutter_dotenv](https://pub.dev/packages/flutter_dotenv) - for environment variables
- [flutter_screenutil](https://pub.dev/packages/flutter_screenutil) - for responsive UI design
- [timeago](https://pub.dev/packages/timeago) - for formatting time

### Dev Libraries

- [json_serializable](https://pub.dev/packages/json_serializable) - for JSON serialization
- [mockito](https://pub.dev/packages/mockito) - for creating mock objects in unit tests
- [mocktail](https://pub.dev/packages/mocktail) - for creating mock objects in unit tests

## Features
1. Displays a list of most popular articles from the NY Times API.
2. Supports different time periods (1, 7, 30 days).
3. Shows article details when a list item is clicked.
4. Uses caching and shimmers to improve user experience.
5. Uses environment variables for API key and base URL.
6. Includes unit tests with code coverage reports.
7. Responsive UI for almost all of the devices sizes

## Getting Started

To run this application, you'll need to follow these steps:

1. Clone this repository to your local machine using `https://github.com/username/repo.git`.
2. Run `flutter pub get` to install the required dependencies.
3. Create a `.env` file in the root directory of the project and add your NY Times API key ( for test purposes i did not add .env file to git ignore to make it easy to run (you are welcome :) ))
4. Run the app using `flutter run`.

## Object Oriented Programming Approach

This project uses object-oriented programming (OOP) principles to create modular, reusable, and maintainable code. The codebase is organized into different directories and files, each containing a specific set of functionalities.

## Good UI Approach

This project follows the MVVM architectural pattern to separate the UI, business logic, and data storage layers. This approach makes the code more organized, scalable, and easier to maintain.

## Unit Test and Code Coverage

This project includes unit tests to ensure that each function and method is working as expected. You can run the tests using the command `flutter test`. Code coverage reports can also be generated using the command `flutter test --coverage`.

## Generating Code Coverage Reports

To generate code coverage reports for the app, you can use the following steps:

1. Run the tests using the `flutter test` command.
2. Generate the coverage reports using the `flutter test --coverage` command.
3. To generate visual representation of the test coverage install `brew install lcov ` and run `genhtml coverage/lcov.info -o coverage/html`
4. Open the `coverage/lcov_report/index.html` file in your web browser to view the coverage report.

## Code to be Generic and Simple

The codebase is written to be as generic and simple as possible, using best practices and design patterns to ensure that it is efficient, easy to understand, and easy to maintain.

## Leverage Today's Best Coding Practices

This project follows the best coding practices, including the use of null safety, async/await, named constructors, and other modern programming concepts.

## Screenshots

Screenshots of the app are included below:

![Article List Screen](https://github.com/alamen-pgooja/times_article_app/blob/main/screenshots/1.png)

![Article Detail Screen](https://github.com/alamen-pgooja/times_article_app/blob/main/screenshots/2.png)
![Article Detail Screen](https://github.com/alamen-pgooja/times_article_app/blob/main/screenshots/3.png)
![Test Coverage](https://github.com/alamen-pgooja/times_article_app/blob/main/screenshots/test1.png)
![Test Coverage](https://github.com/alamen-pgooja/times_article_app/blob/main/screenshots/test2.png)

## License

This project is licensed under the MIT License - see the LICENSE file for details.
