class Exercise implements Comparable<Exercise>{
  String name = "";
  String description = "";
  String bodyPart = "";

  // Constructor
  Exercise (String name, String description, String bodyPart) {
    this.name = name;
    this.description = description;
    this.bodyPart = bodyPart;
  }

  // Override compareTo operation so exercises can be sorted in alphabetical order based on name
  @override
  int compareTo(Exercise other) {
    return name.compareTo(other.name);
  }
}