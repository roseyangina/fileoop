/*The challenge is to create a program that has the following features:

An object-oriented model that uses classes and inheritance
A class that implements an interface
A class that overrides an inherited method
An instance of a class that is initialized with data from a file
A method that demonstrates the use of a loop */ 
import 'dart:io';
class Game{

  String name;
  double rating;
  String genre;
  bool isMode;
  int year;
  
  
  //Constructor
  Game(this.name, this.rating, this.genre, this.isMode, this.year);

  void display(){
    print("Name: $name");
    print("Rating: $rating");
    print("Genre: $genre");
    print("Year: $year");
    print("Player mode: ${isMode ? 'Single' : 'Multi'}");
    
  }
}

abstract class GameType{
  void type();
}

class F1 extends GameType{
  @override
  void type(){
    print("F1 is a Racing game");
  }
}

class Sims extends GameType{
  @override
  void type(){
    print("Sims is a Simulation game");
  }
}

class AndroidGames extends Game{
  AndroidGames(String name, double rating) : super(name, rating, '', false, 0);

 // Method to create a list of AndroidGames from the CSV file.
  static List<AndroidGames> csvData(String filePath) {
    List<AndroidGames> games = [];
    final file = File(filePath); // Prepare the file for reading.
    List<String> lines = file.readAsLinesSync(); // Read all lines from the file.

       // Skip the first line (header)
    for (var i = 1; i < lines.length; i++) {
      final line = lines[i];
      final lastIndex = line.lastIndexOf(',');
      if (lastIndex != -1) {
        // Split the line at the last comma
        final name = line.substring(0, lastIndex).trim();
        final ratingStr = line.substring(lastIndex + 1).trim();
        // Parse the rating as a double, defaulting to 0.0 if parsing fails.
        final rating = double.tryParse(ratingStr) ?? 0.0;
         
        if (rating >= 4.5){
          // Adding it to the list if it meets the criterion by creating an instance of AndroidGames
          games.add(AndroidGames(name, rating));
        
        }
        
      }
    }
    //Returning the populated list
    return games;
  }
}

void main() {

//For Game super class and its method
  var player1 = Game('SubwaySurfers', 4.6, 'Arcade', true, 2008);
  player1.display();

//For classes extending from abstract class GameType
  F1 f1 = F1();
  f1.type();

  Sims sims = Sims();
  sims.type();

//AndroidGames Class

  String filePath = "android-games.csv";
  List<AndroidGames> games = AndroidGames.csvData(filePath);

  // Print each game in the list
  for (var game in games) {
    print('Name: ${game.name}, Rating: ${game.rating}');
  }
}