class GenZService {
  static String getMeaning(String word) {
    switch (word.toLowerCase()) {
      // Happy words
      case "happy":
      case "joy":
      case "joyful":
      case "excited":
      case "cheerful":
        return "Feeling awesome and vibing 😎";

      // Sad words
      case "sad":
      case "unhappy":
      case "depressed":
      case "upset":
        return "Not having the best day 🥲";

      // Angry words
      case "angry":
      case "mad":
      case "furious":
      case "annoyed":
        return "Totally triggered 😤";

      // Love words
      case "love":
      case "romance":
      case "affection":
        return "Main character energy ❤️";

      // Cool words
      case "cool":
      case "awesome":
      case "amazing":
      case "great":
        return "Straight fire 🔥";

      // Tired words
      case "tired":
      case "sleepy":
      case "exhausted":
        return "Running on 1% battery 😴";

      // Money words
      case "money":
      case "cash":
      case "wealth":
      case "income":
        return "Securing the bag 💰";

      // Friend words
      case "friend":
      case "buddy":
      case "pal":
      case "companion":
        return "Your ride-or-die bestie 🤝";

      // Study words
      case "study":
      case "education":
      case "learning":
      case "knowledge":
        return "Leveling up your brain stats 🧠";

      // Success words
      case "success":
      case "achievement":
      case "victory":
      case "winner":
        return "Boss level unlocked 🏆";

      // Technology words
      case "technology":
      case "computer":
      case "software":
      case "internet":
        return "Future stuff running the world 🚀";

      // Space words
      case "galaxy":
      case "planet":
      case "star":
      case "universe":
        return "Cosmic vibes activated 🌌";

      // Dream words
      case "dream":
      case "goal":
      case "ambition":
        return "Manifesting greatness ✨";

      default:
        return "No Gen-Z translation available ✨";
    }
  }
}