enum Province {
  japan,
  kanto,
  hokkaido,
  kansai,
  tohoku,
  chubu,
  chugoku,
  shikoku,
  kyushu;
}

extension ProvinceExtension on Province {
  int get value {
    switch (this) {
      case Province.japan:
        return 0;
      case Province.kanto:
        return 1;
      case Province.hokkaido:
        return 2;
      case Province.kansai:
        return 3;
      case Province.tohoku:
        return 4;
      case Province.chubu:
        return 5;
      case Province.chugoku:
        return 6;
      case Province.shikoku:
        return 7;
      case Province.kyushu:
        return 8;
    }
  }
}
