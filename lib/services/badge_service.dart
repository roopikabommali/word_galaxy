class BadgeService {
  static List<String> getBadges(int xp) {
    List<String> badges = [];

    if (xp >= 50) {
      badges.add("🥉 Beginner Explorer");
    }

    if (xp >= 100) {
      badges.add("🥈 Word Learner");
    }

    if (xp >= 250) {
      badges.add("🥇 Vocabulary Master");
    }

    if (xp >= 500) {
      badges.add("💎 Galaxy Legend");
    }

    return badges;
  }
}