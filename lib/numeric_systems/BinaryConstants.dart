class BinaryConstants {
  static Map<String, String> value = {
    "0": "0",
    "1": "1",
    "2": "2",
    "3": "3",
    "4": "4",
    "5": "5",
    "6": "6",
    "7": "7",
    "8": "8",
    "9": "9",
    "10": "A",
    "11": "B",
    "12": "C",
    "13": "D",
    "14": "E",
    "15": "F",
    "A": "10",
    "B": "11",
    "C": "12",
    "D": "13",
    "E": "14",
    "F": "15"
  };

  static int getDecimal (String val){
    return int.parse(value[val]!);
  }
}
