# coding: utf-8
Feature: 全曲リスト

  ユーザーは全曲リストがほしい。
  それを見ながら楽曲管理をするため。

  Scenario: 登録されている全曲リストを表示するURLにアクセスする。
    Given 楽曲が登録されていること。
    When  楽曲管理画面が表示された時、
    Then  Blue Jay Wayが表示されている。
