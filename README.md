# 古本のフリマ

出品／購入（注文）／チャット／レビュー／お気に入り／通報／管理画面 を備えた学習用フリマ系 Web アプリです。  
Spring Boot（MVC）+ Thymeleaf で画面を提供し、DB は PostgreSQL を想定しています。

---

## 技術スタック

- Java: **17**
- Spring Boot: **3.2.0**
- Spring MVC / Spring Security / Spring Data JPA
- Thymeleaf（テンプレート）
- DB: PostgreSQL（メイン） / H2（依存あり）
- 画像: Cloudinary（依存あり）
- 決済: Stripe（依存あり）
- Build: Maven（`pom.xml`）

---

## 主な機能

- トップページ: `/`
- ログイン: `/login`

### 商品（Item）

- 一覧（トップに表示）
- 詳細: `/items/{id}`
- 新規作成: `/items/new`
- 編集: `/items/{id}/edit`
- 削除/更新: `/items/{id}`（POST）, `/items/{id}/delete`（POST）
- お気に入り登録/解除: `/items/{id}/favorite` / `/items/{id}/unfavorite`（POST）

### マイページ: `/my-page/*`

- 出品中: `/my-page/selling`
- 購入履歴: `/my-page/orders`
- 売上/販売: `/my-page/sales`
- お気に入り: `/my-page/favorites`
- レビュー: `/my-page/reviews`

### チャット / レビュー / 通報 / 注文

- チャット: `/chat/{itemId}`（GET/POST）
- レビュー投稿: `/reviews/new/{orderId}`
- 通報: `/reports`
- 注文（Stripe 決済含む）: `/orders/*`
  - 購入開始: `/orders/initiate-purchase`（POST）
  - 決済確認: `/orders/confirm-payment`
  - 購入完了: `/orders/complete-purchase`
  - Webhook: `/orders/stripe-webhook`（POST）
  - 発送: `/orders/{id}/ship`（POST）

### 管理者: `/admin/*`

- 出品管理: `/admin/items`
- 通報一覧: `/admin/reports`
- ユーザー管理: `/admin/users/{id}` / BAN・解除（POST）

---

## ディレクトリ構成（主要）
## ディレクトリ構成（主要）

> ※ ツリーはコードブロック内に入れる（Eclipseで崩れにくい）

```text
.
├── pom.xml                         # Maven 設定
└── src/
    └── main/
        ├── java/
        │   └── com/example/fleamarketsystem/
        │       ├── FleaMarketSystemCompleteApplication.java
        │       ├── config/
        │       │   └── SecurityConfig.java
        │       ├── controller/
        │       │   ├── AdminController.java
        │       │   ├── AdminUserController.java
        │       │   ├── AppOrderController.java
        │       │   ├── ChatController.java
        │       │   ├── DashboardController.java
        │       │   ├── DashboardController.java
        │       │   ├── HomeController.java
        │       │   ├── ItemController.java
        │       │   ├── LoginController.java
        │       │   ├── ReportController.java
        │       │   ├── ReviewController.java
        │       │   ├── UserController.java
        │       │   └── UserProfileController.java
        │       ├── service/
        │       │   ├── AdminUserService.java
        │       │   ├── AppOrderService.java
        │       │   ├── CategoryService.java
        │       │   ├── ChatService.java
        │       │   ├── CloudinaryService.java
        │       │   ├── FavoriteService.java
        │       │   ├── ItemService.java
        │       │   ├── LineNotifyService.java
        │       │   ├── ReportService.java
        │       │   ├── ReviewService.java
        │       │   ├── StripeService.java
        │       │   └── UserService.java
        │       ├── entity/
        │       │   ├── AppOrder.java
        │       │   ├── Category.java
        │       │   ├── Chat.java
        │       │   ├── FavoriteItem.java
        │       │   ├── Item.java
        │       │   ├── Report.java
        │       │   ├── Review.java
        │       │   ├── User.java
        │       │   └── UserComplaint.java
        │       ├── repository/
        │       │   ├── AppOrderRepository.java
        │       │   ├── CategoryRepository.java
        │       │   ├── ChatRepository.java
        │       │   ├── FavoriteItemRepository.java
        │       │   ├── ItemRepository.java
        │       │   ├── ReportRepository.java
        │       │   ├── ReviewRepository.java
        │       │   ├── UserComplaintRepository.java
        │       │   └── UserRepository.java
        │       └── security/
        │           └── CustomUserDetailsService.java
        └── resources/
            ├── application.properties
            ├── schema.sql
            ├── data.sql
            ├── alter_users_add_ban.sql
            ├── templates/
            │   ├── fragments/
            │   │   └── layout.html
            │   ├── admin/
            │   │   └── users/
            │   │       ├── list.html
            │   │       └── detail.html
            │   ├── admin_dashboard.html
            │   ├── admin_items.html
            │   ├── admin_reports.html
            │   ├── admin_statistics.html
            │   ├── buyer_app_orders.html
            │   ├── item_detail.html
            │   ├── item_form.html
            │   ├── item_list.html
            │   ├── login.html
            │   ├── my_favorites.html
            │   ├── my_page.html
            │   ├── payment_confirmation.html
            │   ├── review_form.html
            │   ├── seller_app_orders.html
            │   ├── seller_items.html
            │   ├── user_profile.html
            │   ├── user_reviews.html
            │   └── users.html
            └── static/
                ├── css/
                │   └── style.css
                └── images/
                    └── items/
## 起動に必要なもの

- Java 17
- Maven
- PostgreSQL（推奨。設定が PostgreSQL 前提）

### Maven が無い場合（例）

- macOS（Homebrew）: `brew install maven`
- Windows: Chocolatey/Scoop などで Maven を導入

---

## サンプルアカウント（data.sql）

| 役割   | メール                | パスワード  |
| ------ | --------------------- | ----------- |
| USER   | sellerA@example.com   | password    |
| USER   | xyz@example.com       | password    |
| ADMIN  | adminC@example.com    | adminpass   |

---

## DB セットアップ（PostgreSQL）

`application.properties` の既定値:

- DB: `rebookdb`
- User: `postgres`
- Pass: `postgres`
- URL: `jdbc:postgresql://localhost:5432/rebookdb`

### DB 作成

```bash
createdb rebookdb
# または psql で:
# CREATE DATABASE rebookdb;