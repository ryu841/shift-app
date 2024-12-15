## S-Connect
![ヘッダー画像](app/assets/images/app-image.png)

## サービスのURL
[S-Connect](https://s-connect-c2ee3957a547.herokuapp.com/)

## サービスの概要

## 開発のきっかけ

## 機能一覧
| トップ画面 |　新規登録画面（ユーザー） |
| ---- | ---- |
| ![トップ画面](app/assets/images/top-page.png) | ![新規登録画面（ユーザー）](app/assets/images/user-registraion-page.png) |
| 登録せずにサービスをお試しいただくためのトライアル機能を実装しました。 | 名前とメールアドレス、パスワードで登録できるようにしています。 |

| 新規登録画面（管理者） | ログイン画面 |
| ---- | ---- |
| ![新規登録画面（管理者）](app/assets/images/admin-registration-page.png) | ![ログイン画面](app/assets/images/user-login-page.png) |
| メールアドレスとパスワードで登録できるようにしています。 | メールアドレスとパスワードでの認証機能を実装しました。 |

#### 管理者用機能
| 募集シフト作成画面 |　募集シフト一覧画面 |
| ---- | ---- |
| ![募集シフト作成画面](app/assets/images/admin-new-page.png) | ![募集シフト一覧画面](app/assets/images/admin-index-page.png) |
| 日付、時間、人数、コメントを入力可能です。「募集時間を追加」で最大5つまで追加できます。 | 作成した募集シフトと、ユーザーからの申請を一覧で見ることができるようにしています。 |

| 募集シフト詳細画面 |　シフト削除のモーダル |
| ---- | ---- |
| ![募集シフト詳細画面](app/assets/images/admin-show-page.png) | ![シフト削除のモーダル](app/assets/images/shift-delete-modal.png) |
| 詳細画面から、募集シフトの編集、削除が可能です。 | シフト削除時のモーダルです。 |

| 募集シフト編集画面 | 参加申請一覧画面 |
| ---- | ---- |
| ![募集シフト編集画面](app/assets/images/admin-edit-page.png) | ![参加申請一覧画面](app/assets/images/admin-ticket-page.png) |
| 作成した募集シフトの編集が可能です。 | ユーザーからの参加申請の詳細を確認することができます。ここから「承認」または「却下」ができます。 |

#### ユーザー用機能
| 募集シフト一覧画面 |　募集シフト詳細画面 |
| ---- | ---- |
| ![募集シフト一覧画面](app/assets/images/user-index-page.png) | ![募集シフト詳細画面](app/assets/images/user-show-page.png) |
| 募集シフトと参加申請中のシフトを一覧で確認することができます。 | 募集シフト詳細ページから参加申請を送ることができます。 |

| 参加申請キャンセル | 参加申請シフト削除 |
| ---- | ---- |
| ![参加申請キャンセル](app/assets/images/ticket-cancel-modal.png) | ![参加申請シフト削除](app/assets/images/ticket-delete-modal.png) |
| 「キャンセル」から参加申請をキャンセルすることができます。 | 「承認済み」と「承認却下」のとき、シフト一覧からシフトを削除することができます。|

## 使用技術一覧

## 主要機能一覧