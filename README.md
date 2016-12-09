# 目的
- Swift3.0で変わったNSUserDefaultsの確認
- 独自クラスでUserDefaultsを利用するサンプル


# 機能
- viewDidLoad()でMyData（独自クラス）にデータを保存し、UserDefaultsに書き込み
- 同じくviewDidLoad()で、UserDefaultsから読み出してコンソールに表示


# 独自クラスをUserDefaultsで利用する
- 保存する場合は、一旦シリアライズしてUserDefaultsがサポートするData型に変換してから保存する
- 読み込み時は、デシリアライズしてData型 -> 独自クラスに変換して使用する
- シリアライズ・デシリアライズ処理は、独自クラスにNSCodingプロトコルのメソッドを実装する
  - シリアライズ・デシリアライズを利用する独自クラスは、NSObjectを継承していること
- 実装したメソッドは、それぞれ以下を経由して呼びだされる
  - シリアライズ：NSKeyedArchiver.archivedData(withRootObject: 独自クラスインスタンス)
  - デシリアライズ：NSKeyedUnarchiver.unarchiveObject(with: デシリアライズ対象のデータ as Data)
