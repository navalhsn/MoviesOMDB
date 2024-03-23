# MoviesOMDB
This iOS app allows users to browse a catalog of movies, view details about each movie, and manage a list of favorite movies.

#Table of Contents
Getting Started
Architecture Overview
Assumptions and Additional Features

#Getting Started
To build and run the project, follow these steps:

Clone the repository to your local machine.
Open the project in Xcode.
Build the project using the appropriate scheme and target.
Run the project on a simulator or a physical device.

#Architecture Overview
The app is built using the Model-View-Controller (MVC) architecture pattern. The main components of the architecture are:

Models: Represent the data used in the app, such as movies and their details.
Views: Display the user interface elements, including movie lists, details, and favorite movie management.
Controllers: Manage the interaction between models and views, handling user input and updating the UI accordingly.
The app uses Core Data for local data storage, allowing users to save their favorite movies. It also integrates with a public movie API (e.g., OMDB API) to fetch movie data.

#Assumptions and Additional Features
The app assumes a stable internet connection for fetching movie data from the API.
Additional features implemented include:
A favorites tab or section where users can view all their saved movies.
UI enhancements, such as movie thumbnails and ratings display.
Search functionality to filter movies by title.
