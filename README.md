# .env guide

1. add package ```flutter_dotenv``` to the project. - https://pub.dev/packages/flutter_dotenv
2. add the ```.env``` to the ```assets``` within the pubspec.yml
3. add ```*.env``` to the .gitignore
4. add the import ```import 'package:flutter_dotenv/flutter_dotenv.dart';``` to the main.dart file and use ```await dotenv.load(fileName: ".env");``` to load the .env file and make sure that the .env file is not empty.
5. If it was empty or haven't been created at the time it was added to the pubspec.yml go to pubspec.yml again and press ctrl + save
6. import the package wherever necessary ```import 'package:flutter_dotenv/flutter_dotenv.dart';``` and use ```dotenv.env['VAR_NAME'];``` the ```VAR_NAME``` should be the same as the one you want to load from the .env file.