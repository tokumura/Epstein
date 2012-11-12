# coding: utf-8
Feature: セットリスト条件設定

  ユーザーは自動作成されるセットリストの条件を設定したい。
  曲数、ジョージ曲数、リンゴ曲数の条件設定をしたいから。
  

  Scenario: セットリスト作成のURLにアクセスする。
    Given セットリスト作成のページが存在する。
    When  セットリスト作成のページにアクセスした場合
    Then  セットリスト条件の項目が表示されている。
    And   曲数のリストボックスが表示されている。
    And   ジョージ曲数のリストボックスが表示されている。
    And   リンゴ曲数のリストボックスが表示されている。
    And   '作成'ボタンが表示されている。

