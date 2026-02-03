-- users
INSERT INTO users (name, email, password, role, enabled)
VALUES
  ('出品者A', 'sellerA@example.com', '{noop}password', 'USER', TRUE),
  ('購入者B', 'xyz@example.com', '{noop}password', 'USER', TRUE),
  ('運営者C', 'adminC@example.com',  '{noop}adminpass','ADMIN',TRUE);

-- category
INSERT INTO category (name) VALUES
  ('文芸・小説'), ('実用書'), ('ビジネス書'), ('漫画コミック'),('児童書・絵本'),('雑誌');

-- item
INSERT INTO item (user_id, name, description, price, category_id, status, image_url)
VALUES
(
  (SELECT id FROM users WHERE email='sellerA@example.com'),
  'Javaプログラミング入門',
  '初心者向けのJava入門書です。',
  1500.00,
  (SELECT id FROM category WHERE name='実用書'),
  '出品中',
  '/images/items/java_book.jpg'
),
(
  (SELECT id FROM users WHERE email='sellerA@example.com'),
  'キングダム一巻',
  '熱い漫画',
  500.00,
  (SELECT id FROM category WHERE name='漫画コミック'),
  '売却済',
  '/images/items/king.jpg'
),
(
  (SELECT id FROM users WHERE email='sellerA@example.com'),
  'Python料理大全',
  'レシピ形式で学べる実践Python。',
  1800.00,
  (SELECT id FROM category WHERE name='実用書'),
  '出品中',
  '/images/items/python_cookbook.jpg'
),
(
  (SELECT id FROM users WHERE email='sellerA@example.com'),
  'ビジネス戦略の教科書',
  'フレームワークで整理する戦略思考。',
  1600.00,
  (SELECT id FROM category WHERE name='ビジネス書'),
  '出品中',
  '/images/items/business_strategy.jpg'
),
(
  (SELECT id FROM users WHERE email='sellerA@example.com'),
  '真夜中の図書館',
  '静かな街で起きた不思議な物語。',
  1200.00,
  (SELECT id FROM category WHERE name='文芸・小説'),
  '出品中',
  '/images/items/novel_midnight.jpg'
),
(
  (SELECT id FROM users WHERE email='sellerA@example.com'),
  'きょうりゅう だいずかん',
  'はじめての恐竜図鑑（児童向け）。',
  900.00,
  (SELECT id FROM category WHERE name='児童書・絵本'),
  '出品中',
  '/images/items/kids_dinosaur.jpg'
),
(
  (SELECT id FROM users WHERE email='sellerA@example.com'),
  '銀河まんが 第1巻',
  '宇宙を舞台にした冒険コミック。',
  500.00,
  (SELECT id FROM category WHERE name='漫画コミック'),
  '出品中',
  '/images/items/manga_space.jpg'
),
(
  (SELECT id FROM users WHERE email='sellerA@example.com'),
  'ガジェット雑誌 2月号',
  '最新デバイス特集。',
  650.00,
  (SELECT id FROM category WHERE name='雑誌'),
  '出品中',
  '/images/items/magazine_gadget.jpg'
),
(
  (SELECT id FROM users WHERE email='sellerA@example.com'),
  '一人暮らしの実用料理',
  '簡単・時短・節約レシピ集。',
  1100.00,
  (SELECT id FROM category WHERE name='実用書'),
  '売却済',
  '/images/items/practical_cooking.jpg'
),
(
  (SELECT id FROM users WHERE email='sellerA@example.com'),
  '俳句と季節のことば',
  '言葉のリズムを味わう文芸書。',
  1000.00,
  (SELECT id FROM category WHERE name='文芸・小説'),
  '出品中',
  '/images/items/literature_haiku.jpg'
),
(
  (SELECT id FROM users WHERE email='sellerA@example.com'),
  '日常コミック ベスト',
  'ゆるっと笑えるショート集。',
  700.00,
  (SELECT id FROM category WHERE name='漫画コミック'),
  '売却済',
  '/images/items/comic_daily.jpg'
),
(
  (SELECT id FROM users WHERE email='sellerA@example.com'),
  'お金の基本がわかる本',
  '家計管理と貯蓄の入門。',
  1400.00,
  (SELECT id FROM category WHERE name='ビジネス書'),
  '出品中',
  '/images/items/business_money.jpg'
);
