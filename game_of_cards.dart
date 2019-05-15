main() {
  var deck = new Deck();
  // Shuffling:
  // deck.shuffle();
  // print(deck.cardWithSuit('Diamonds'));

  // Dealing
  // print(deck);
  // print(deck.deal(5));
  // print(deck);

  // Removing cards
  print('Line 13: $deck'); // will print with Two of Diamonds included
  deck.removeCard("Diamonds", "Two");
  print('Line 15: $deck');// will print without Two of Diamonds

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
        // var card = new Card(rank, suit); // The order in which the two argument is passed in matters a lot.
        var card = new Card(suit:suit, rank:rank,);// using with named arguments...the order of argument no longer matters
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
  // Long format
  // cardWithSuit(String suit) {
  //   return cards.where((e) {//.where method returns a list..its just the filter in JS
  //     return e.suit == suit;
  //   });
  // }
  //Short format: 
  cardWithSuit(String suit) {
    return cards.where((e) => e.suit == suit);
  }

  deal(int handSize) {
    var hand = cards.sublist(0, handSize);//take from index zero to the size provided...
    cards.sublist(handSize);// take from handsize all the way to the end
    return hand;
  }
  removeCard(String suit, String rank) {
    cards.removeWhere((e) => e.suit == suit && e.rank == rank);
  }
}

class Card {
  String suit;
  String rank;
  //Card(this.rank, this.suit); // The oder in which these two argumetents will be passed in matters a lot
  Card({this.rank, this.suit}); //this is a constructor with named arguments...the order in which arguments will be passed in does not matter
  @override
  String toString() {
    return '$rank of $suit';
  }
}
