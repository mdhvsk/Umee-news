# Umee-news
Mobile News Application to share and upload news stories with your community. 

## What it does
Umee news allows users to:
* Browse through a feed of news articles
* Post their own news stories
* Like and comment on articles


## Design Choices 

1. **Cross-Platform Development with Flutter**: Flutter was chosen for its ability to create high-performance, visually appealing, cross platform applications.
2. **Supabase as Backend**: Selected for its simplicity in setup, cost-effectiveness, and powerful features such as Object Store, Auth, Postgres Database, and Edge Functions.
3. **Material Design**: Utilized Flutter's Material Design components to ensure a consistent and intuitive user interface across the application.

## Tech Used: 
* Flutter
* Dart
* Supabase

## Tips for Getting Started 
1. **Flutter Setup**:
    * Install Flutter: https://docs.flutter.dev/get-started/install
    * Set up your IDE/Text Editor with Dart and Flutter Plugin.
2. **Supabase Setup**:
    * Create a Supabase account and set up a new project.
    * Note down your Supabase URL and anon key for configuration.
    * Setup up postgres schema and buckets: TBD
3. **Project Configuration**: 
    * Clone the repository: `git clone https://github.com/mdhvsk/umee-news.git`.
    * Install dependencies: `flutter pub get`.
    * Set up Supabase url and anon key, see `.env.example` for details.
4. **Run the App**:
    * Connect to a device/emulator.
    * Run: `flutter run`.
5. **Contributing**: 
    * Fork the repository and create a new branch for your feature or bug fix.
    * Follow the project's coding standards and guidelines.
Submit a pull request with a clear description of your changes.

