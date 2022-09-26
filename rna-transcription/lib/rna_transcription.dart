class RnaTranscription {
  Map<String, String> complements = {
    'G': 'C',
    'C': 'G',
    'T': 'A',
    'A': 'U',
  };

  String toRna(String dna) {
    return dna.split('').map((e) => complements[e]).join();
  }
}
