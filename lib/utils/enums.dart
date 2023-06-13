enum StateEvent {
  isExpired,
  isFull,
  isAvailable,
}

enum StateStatus {
  init,
  loading,
  loadingMore,
  success,
  error,
  refresh,
}

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}

enum Locale { FR, EN }

final localeValues = EnumValues({"en": Locale.EN, "fr": Locale.FR});

enum LocationName { PLAGE, MONTAGNE, FORT, CAMPAGNE, VILLE, SAHARA }

final locationNameValues = EnumValues({
  "Campagne": LocationName.CAMPAGNE,
  "Forêt": LocationName.FORT,
  "Montagne": LocationName.MONTAGNE,
  "Plage": LocationName.PLAGE,
  "Sahara": LocationName.SAHARA,
  "Ville": LocationName.VILLE
});

enum TermName {
  MAISON_DE_VACANCE,
  MAISON_D_HTES,
  GITE_RURAL,
  FERME_COLOGIQUE,
  CHAMBRE_D_HTES,
  AUBERGE
}

final termNameValues = EnumValues({
  "Auberge": TermName.AUBERGE,
  "Chambre d'hôtes": TermName.CHAMBRE_D_HTES,
  "Ferme écologique": TermName.FERME_COLOGIQUE,
  "Gite rural": TermName.GITE_RURAL,
  "Maison de vacance": TermName.MAISON_DE_VACANCE,
  "Maison d'hôtes": TermName.MAISON_D_HTES
});

enum TranslationTermName { GUEST_HOUSE, ECOLOGICAL_FARM, HOSTEL }

final translationTermNameValues = EnumValues({
  "Ecological farm": TranslationTermName.ECOLOGICAL_FARM,
  "Guest house": TranslationTermName.GUEST_HOUSE,
  "Hostel": TranslationTermName.HOSTEL
});

enum TranslationLocationName { SEASIDE, FOREST, COUNTRYSIDE, CITY, SAHARA }

final translationLocationNameValues = EnumValues({
  "City": TranslationLocationName.CITY,
  "Countryside": TranslationLocationName.COUNTRYSIDE,
  "Forest": TranslationLocationName.FOREST,
  "Sahara": TranslationLocationName.SAHARA,
  "Seaside": TranslationLocationName.SEASIDE
});

enum PerPerson { NUIT, PERSONNE }

final perPersonValues =
    EnumValues({"nuit": PerPerson.NUIT, "personne": PerPerson.PERSONNE});

enum PerPersonTranslation { NIGHT, PERSON }

final perPersonTranslationValues = EnumValues({
  "night": PerPersonTranslation.NIGHT,
  "person": PerPersonTranslation.PERSON
});

enum TypeHost { PAR_CHALET, PAR_PERSONNE, MAISON_ENTIRE }

final typeHostValues = EnumValues({
  "Maison Entière": TypeHost.MAISON_ENTIRE,
  "Par Chalet": TypeHost.PAR_CHALET,
  "Par Personne": TypeHost.PAR_PERSONNE
});

enum TypeHostTranslation { PER_CHALET, PER_PERSON, ENTIRE_HOUSING }

final typeHostTranslationValues = EnumValues({
  "Entire Housing": TypeHostTranslation.ENTIRE_HOUSING,
  "Per Chalet": TypeHostTranslation.PER_CHALET,
  "Per Person": TypeHostTranslation.PER_PERSON
});
