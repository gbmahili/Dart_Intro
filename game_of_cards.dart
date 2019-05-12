
main() {
  var deck = new Deck();
  deck.shuffle();
  print(deck.cardWithSuit('Diamonds'));

}
class Deck {
  // An array of cards
  List<Card> cards = <Card>[];

  // Constructor
  Deck() {
    // list of ranks
    var ranks = ['Ace', 'Two', 'Three', 'Four', 'Five'];
    var suits = ['Diamonds', 'Hearts', 'Clubs', 'Spads'];

    for (var suit in suits) {
      for (var rank in ranks) {
        var card = new Card(rank, suit);
        cards.add(card);
      }
    }
  }

  @override
  String toString() {
    return cards.toString();
  }

  shuffle() {
    cards.shuffle();
  }

  cardWithSuit(String suit) {
    return cards.where((e) {
      return e.suit == suit;
    });
  }
}

class Card {
  String suit;
  String rank;
  Card(this.rank, this.suit);
  @override
  String toString() {
    return '$rank of $suit';
  }
}
