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
);
