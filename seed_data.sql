INSERT INTO shoes (
      id, brand, name, gender, style_tags, color_tags, colorway,
      amazon_url, amazon_asin, image_url, price, retail_price, is_featured, is_active,
      view_count, click_count, favorite_count, sizes_available, created_at, updated_at
    ) VALUES (
      gen_random_uuid(),
      'Nike',
      'Air Force 1 ''07',
      'men',
      ARRAY['classic', 'streetwear', 'timeless'],
      ARRAY['white'],
      'White/White',
      'https://www.amazon.com/dp/B07QXLFLXT?tag=shoeswiper-20',
      'B07QXLFLXT',
      'https://m.media-amazon.com/images/I/B07QXLFLXT._AC_SX679_.jpg',
      115,
      115,
      true,
      true,
      2949,
      440,
      158,
      ARRAY['7', '7.5', '8', '8.5', '9', '9.5', '10', '10.5', '11', '11.5', '12', '13'],
      NOW(),
      NOW()
    );

INSERT INTO shoes (
      id, brand, name, gender, style_tags, color_tags, colorway,
      amazon_url, amazon_asin, image_url, price, retail_price, is_featured, is_active,
      view_count, click_count, favorite_count, sizes_available, created_at, updated_at
    ) VALUES (
      gen_random_uuid(),
      'Nike',
      'Air Force 1 ''07 LV8',
      'men',
      ARRAY['streetwear', 'casual', 'premium'],
      ARRAY['black', 'white'],
      'Black/White',
      'https://www.amazon.com/dp/B0BYFDR63J?tag=shoeswiper-20',
      'B0BYFDR63J',
      'https://m.media-amazon.com/images/I/B0BYFDR63J._AC_SX679_.jpg',
      130,
      130,
      false,
      true,
      3998,
      379,
      196,
      ARRAY['7', '7.5', '8', '8.5', '9', '9.5', '10', '10.5', '11', '11.5', '12', '13'],
      NOW(),
      NOW()
    );

INSERT INTO shoes (
      id, brand, name, gender, style_tags, color_tags, colorway,
      amazon_url, amazon_asin, image_url, price, retail_price, is_featured, is_active,
      view_count, click_count, favorite_count, sizes_available, created_at, updated_at
    ) VALUES (
      gen_random_uuid(),
      'Nike',
      'Air Force 1 Low',
      'women',
      ARRAY['classic', 'clean', 'everyday'],
      ARRAY['white'],
      'White/White',
      'https://www.amazon.com/dp/B0CZR8VBXN?tag=shoeswiper-20',
      'B0CZR8VBXN',
      'https://m.media-amazon.com/images/I/B0CZR8VBXN._AC_SX679_.jpg',
      115,
      115,
      false,
      true,
      1500,
      216,
      24,
      ARRAY['7', '7.5', '8', '8.5', '9', '9.5', '10', '10.5', '11', '11.5', '12', '13'],
      NOW(),
      NOW()
    );

INSERT INTO shoes (
      id, brand, name, gender, style_tags, color_tags, colorway,
      amazon_url, amazon_asin, image_url, price, retail_price, is_featured, is_active,
      view_count, click_count, favorite_count, sizes_available, created_at, updated_at
    ) VALUES (
      gen_random_uuid(),
      'Nike',
      'Dunk Low Retro',
      'men',
      ARRAY['streetwear', 'casual', 'trendy'],
      ARRAY['black', 'white'],
      'Black/White Panda',
      'https://www.amazon.com/dp/B09NLN47LP?tag=shoeswiper-20',
      'B09NLN47LP',
      'https://m.media-amazon.com/images/I/B09NLN47LP._AC_SX679_.jpg',
      115,
      115,
      true,
      true,
      4191,
      223,
      134,
      ARRAY['7', '7.5', '8', '8.5', '9', '9.5', '10', '10.5', '11', '11.5', '12', '13'],
      NOW(),
      NOW()
    );

INSERT INTO shoes (
      id, brand, name, gender, style_tags, color_tags, colorway,
      amazon_url, amazon_asin, image_url, price, retail_price, is_featured, is_active,
      view_count, click_count, favorite_count, sizes_available, created_at, updated_at
    ) VALUES (
      gen_random_uuid(),
      'Nike',
      'Dunk Low Retro',
      'women',
      ARRAY['streetwear', 'trendy', 'clean'],
      ARRAY['white', 'black'],
      'White/Black Panda',
      'https://www.amazon.com/dp/B08QBZFVY5?tag=shoeswiper-20',
      'B08QBZFVY5',
      'https://m.media-amazon.com/images/I/B08QBZFVY5._AC_SX679_.jpg',
      115,
      115,
      true,
      true,
      972,
      274,
      27,
      ARRAY['7', '7.5', '8', '8.5', '9', '9.5', '10', '10.5', '11', '11.5', '12', '13'],
      NOW(),
      NOW()
    );

INSERT INTO shoes (
      id, brand, name, gender, style_tags, color_tags, colorway,
      amazon_url, amazon_asin, image_url, price, retail_price, is_featured, is_active,
      view_count, click_count, favorite_count, sizes_available, created_at, updated_at
    ) VALUES (
      gen_random_uuid(),
      'Nike',
      'Dunk Low Next Nature',
      'women',
      ARRAY['sustainable', 'streetwear', 'trendy'],
      ARRAY['multi'],
      'Various',
      'https://www.amazon.com/dp/B0DWHRNVFN?tag=shoeswiper-20',
      'B0DWHRNVFN',
      'https://m.media-amazon.com/images/I/B0DWHRNVFN._AC_SX679_.jpg',
      115,
      115,
      false,
      true,
      3026,
      83,
      82,
      ARRAY['7', '7.5', '8', '8.5', '9', '9.5', '10', '10.5', '11', '11.5', '12', '13'],
      NOW(),
      NOW()
    );

INSERT INTO shoes (
      id, brand, name, gender, style_tags, color_tags, colorway,
      amazon_url, amazon_asin, image_url, price, retail_price, is_featured, is_active,
      view_count, click_count, favorite_count, sizes_available, created_at, updated_at
    ) VALUES (
      gen_random_uuid(),
      'Nike',
      'SB Dunk Low Pro',
      'men',
      ARRAY['skate', 'streetwear', 'casual'],
      ARRAY['multi'],
      'Various',
      'https://www.amazon.com/dp/B08P1KVDRB?tag=shoeswiper-20',
      'B08P1KVDRB',
      'https://m.media-amazon.com/images/I/B08P1KVDRB._AC_SX679_.jpg',
      120,
      120,
      false,
      true,
      497,
      247,
      179,
      ARRAY['7', '7.5', '8', '8.5', '9', '9.5', '10', '10.5', '11', '11.5', '12', '13'],
      NOW(),
      NOW()
    );

INSERT INTO shoes (
      id, brand, name, gender, style_tags, color_tags, colorway,
      amazon_url, amazon_asin, image_url, price, retail_price, is_featured, is_active,
      view_count, click_count, favorite_count, sizes_available, created_at, updated_at
    ) VALUES (
      gen_random_uuid(),
      'Nike',
      'Dunk High Retro',
      'men',
      ARRAY['basketball', 'retro', 'streetwear'],
      ARRAY['multi'],
      'Various',
      'https://www.amazon.com/dp/B0DGKPZ6XN?tag=shoeswiper-20',
      'B0DGKPZ6XN',
      'https://m.media-amazon.com/images/I/B0DGKPZ6XN._AC_SX679_.jpg',
      125,
      125,
      false,
      true,
      4754,
      494,
      17,
      ARRAY['7', '7.5', '8', '8.5', '9', '9.5', '10', '10.5', '11', '11.5', '12', '13'],
      NOW(),
      NOW()
    );

INSERT INTO shoes (
      id, brand, name, gender, style_tags, color_tags, colorway,
      amazon_url, amazon_asin, image_url, price, retail_price, is_featured, is_active,
      view_count, click_count, favorite_count, sizes_available, created_at, updated_at
    ) VALUES (
      gen_random_uuid(),
      'Nike',
      'Air Max 90',
      'men',
      ARRAY['retro', 'casual', 'classic'],
      ARRAY['white', 'black'],
      'White/Black',
      'https://www.amazon.com/dp/B0DFVXG97P?tag=shoeswiper-20',
      'B0DFVXG97P',
      'https://m.media-amazon.com/images/I/B0DFVXG97P._AC_SX679_.jpg',
      130,
      130,
      false,
      true,
      4025,
      12,
      127,
      ARRAY['7', '7.5', '8', '8.5', '9', '9.5', '10', '10.5', '11', '11.5', '12', '13'],
      NOW(),
      NOW()
    );

INSERT INTO shoes (
      id, brand, name, gender, style_tags, color_tags, colorway,
      amazon_url, amazon_asin, image_url, price, retail_price, is_featured, is_active,
      view_count, click_count, favorite_count, sizes_available, created_at, updated_at
    ) VALUES (
      gen_random_uuid(),
      'Nike',
      'Air Max 90',
      'women',
      ARRAY['retro', 'casual', 'classic'],
      ARRAY['white', 'pink'],
      'White/Pink',
      'https://www.amazon.com/dp/B0B1YDKWZW?tag=shoeswiper-20',
      'B0B1YDKWZW',
      'https://m.media-amazon.com/images/I/B0B1YDKWZW._AC_SX679_.jpg',
      130,
      130,
      false,
      true,
      1131,
      459,
      120,
      ARRAY['7', '7.5', '8', '8.5', '9', '9.5', '10', '10.5', '11', '11.5', '12', '13'],
      NOW(),
      NOW()
    );

INSERT INTO shoes (
      id, brand, name, gender, style_tags, color_tags, colorway,
      amazon_url, amazon_asin, image_url, price, retail_price, is_featured, is_active,
      view_count, click_count, favorite_count, sizes_available, created_at, updated_at
    ) VALUES (
      gen_random_uuid(),
      'Nike',
      'Air Max Plus',
      'men',
      ARRAY['streetwear', 'bold', 'chunky'],
      ARRAY['black', 'green'],
      'Black/Volt',
      'https://www.amazon.com/dp/B0DSNF3FHZ?tag=shoeswiper-20',
      'B0DSNF3FHZ',
      'https://m.media-amazon.com/images/I/B0DSNF3FHZ._AC_SX679_.jpg',
      175,
      175,
      false,
      true,
      3892,
      79,
      34,
      ARRAY['7', '7.5', '8', '8.5', '9', '9.5', '10', '10.5', '11', '11.5', '12', '13'],
      NOW(),
      NOW()
    );

INSERT INTO shoes (
      id, brand, name, gender, style_tags, color_tags, colorway,
      amazon_url, amazon_asin, image_url, price, retail_price, is_featured, is_active,
      view_count, click_count, favorite_count, sizes_available, created_at, updated_at
    ) VALUES (
      gen_random_uuid(),
      'Nike',
      'Air Max 97',
      'women',
      ARRAY['retro', 'metallic', 'bold'],
      ARRAY['silver'],
      'Silver Bullet',
      'https://www.amazon.com/dp/B08WPWWWQN?tag=shoeswiper-20',
      'B08WPWWWQN',
      'https://m.media-amazon.com/images/I/B08WPWWWQN._AC_SX679_.jpg',
      175,
      175,
      false,
      true,
      4321,
      342,
      164,
      ARRAY['7', '7.5', '8', '8.5', '9', '9.5', '10', '10.5', '11', '11.5', '12', '13'],
      NOW(),
      NOW()
    );

INSERT INTO shoes (
      id, brand, name, gender, style_tags, color_tags, colorway,
      amazon_url, amazon_asin, image_url, price, retail_price, is_featured, is_active,
      view_count, click_count, favorite_count, sizes_available, created_at, updated_at
    ) VALUES (
      gen_random_uuid(),
      'Nike',
      'Air Max 1',
      'men',
      ARRAY['retro', 'classic', 'iconic'],
      ARRAY['multi'],
      'Various',
      'https://www.amazon.com/dp/B0D24HN2CB?tag=shoeswiper-20',
      'B0D24HN2CB',
      'https://m.media-amazon.com/images/I/B0D24HN2CB._AC_SX679_.jpg',
      140,
      140,
      false,
      true,
      4075,
      324,
      66,
      ARRAY['7', '7.5', '8', '8.5', '9', '9.5', '10', '10.5', '11', '11.5', '12', '13'],
      NOW(),
      NOW()
    );

INSERT INTO shoes (
      id, brand, name, gender, style_tags, color_tags, colorway,
      amazon_url, amazon_asin, image_url, price, retail_price, is_featured, is_active,
      view_count, click_count, favorite_count, sizes_available, created_at, updated_at
    ) VALUES (
      gen_random_uuid(),
      'Nike',
      'Air VaporMax Plus',
      'men',
      ARRAY['futuristic', 'bold', 'streetwear'],
      ARRAY['black'],
      'Black',
      'https://www.amazon.com/dp/B0DG4YWLZL?tag=shoeswiper-20',
      'B0DG4YWLZL',
      'https://m.media-amazon.com/images/I/B0DG4YWLZL._AC_SX679_.jpg',
      210,
      210,
      false,
      true,
      3834,
      48,
      21,
      ARRAY['7', '7.5', '8', '8.5', '9', '9.5', '10', '10.5', '11', '11.5', '12', '13'],
      NOW(),
      NOW()
    );

INSERT INTO shoes (
      id, brand, name, gender, style_tags, color_tags, colorway,
      amazon_url, amazon_asin, image_url, price, retail_price, is_featured, is_active,
      view_count, click_count, favorite_count, sizes_available, created_at, updated_at
    ) VALUES (
      gen_random_uuid(),
      'Nike',
      'Air Max SC',
      'women',
      ARRAY['casual', 'comfort', 'modern'],
      ARRAY['white', 'pink'],
      'White/Pink',
      'https://www.amazon.com/dp/B0F2G9G9H9?tag=shoeswiper-20',
      'B0F2G9G9H9',
      'https://m.media-amazon.com/images/I/B0F2G9G9H9._AC_SX679_.jpg',
      90,
      90,
      false,
      true,
      2062,
      198,
      163,
      ARRAY['7', '7.5', '8', '8.5', '9', '9.5', '10', '10.5', '11', '11.5', '12', '13'],
      NOW(),
      NOW()
    );

INSERT INTO shoes (
      id, brand, name, gender, style_tags, color_tags, colorway,
      amazon_url, amazon_asin, image_url, price, retail_price, is_featured, is_active,
      view_count, click_count, favorite_count, sizes_available, created_at, updated_at
    ) VALUES (
      gen_random_uuid(),
      'Nike',
      'Free Metcon 5',
      'men',
      ARRAY['training', 'athletic', 'performance'],
      ARRAY['black', 'white'],
      'Black/White',
      'https://www.amazon.com/dp/B0C7QHDR63?tag=shoeswiper-20',
      'B0C7QHDR63',
      'https://m.media-amazon.com/images/I/B0C7QHDR63._AC_SX679_.jpg',
      120,
      120,
      false,
      true,
      1644,
      395,
      172,
      ARRAY['7', '7.5', '8', '8.5', '9', '9.5', '10', '10.5', '11', '11.5', '12', '13'],
      NOW(),
      NOW()
    );

INSERT INTO shoes (
      id, brand, name, gender, style_tags, color_tags, colorway,
      amazon_url, amazon_asin, image_url, price, retail_price, is_featured, is_active,
      view_count, click_count, favorite_count, sizes_available, created_at, updated_at
    ) VALUES (
      gen_random_uuid(),
      'Nike',
      'Free Metcon 5',
      'women',
      ARRAY['training', 'athletic', 'performance'],
      ARRAY['multi'],
      'Various',
      'https://www.amazon.com/dp/B0BS6MTK41?tag=shoeswiper-20',
      'B0BS6MTK41',
      'https://m.media-amazon.com/images/I/B0BS6MTK41._AC_SX679_.jpg',
      120,
      120,
      false,
      true,
      1266,
      258,
      184,
      ARRAY['7', '7.5', '8', '8.5', '9', '9.5', '10', '10.5', '11', '11.5', '12', '13'],
      NOW(),
      NOW()
    );

INSERT INTO shoes (
      id, brand, name, gender, style_tags, color_tags, colorway,
      amazon_url, amazon_asin, image_url, price, retail_price, is_featured, is_active,
      view_count, click_count, favorite_count, sizes_available, created_at, updated_at
    ) VALUES (
      gen_random_uuid(),
      'Nike',
      'Vomero 18',
      'men',
      ARRAY['running', 'comfort', 'athletic'],
      ARRAY['black', 'white'],
      'Black/White',
      'https://www.amazon.com/dp/B0CVXHZ3VN?tag=shoeswiper-20',
      'B0CVXHZ3VN',
      'https://m.media-amazon.com/images/I/B0CVXHZ3VN._AC_SX679_.jpg',
      160,
      160,
      false,
      true,
      836,
      100,
      137,
      ARRAY['7', '7.5', '8', '8.5', '9', '9.5', '10', '10.5', '11', '11.5', '12', '13'],
      NOW(),
      NOW()
    );

INSERT INTO shoes (
      id, brand, name, gender, style_tags, color_tags, colorway,
      amazon_url, amazon_asin, image_url, price, retail_price, is_featured, is_active,
      view_count, click_count, favorite_count, sizes_available, created_at, updated_at
    ) VALUES (
      gen_random_uuid(),
      'Nike',
      'Vomero 18',
      'women',
      ARRAY['running', 'comfort', 'performance'],
      ARRAY['multi'],
      'Various',
      'https://www.amazon.com/dp/B0DYVSDM94?tag=shoeswiper-20',
      'B0DYVSDM94',
      'https://m.media-amazon.com/images/I/B0DYVSDM94._AC_SX679_.jpg',
      160,
      160,
      false,
      true,
      3450,
      398,
      162,
      ARRAY['7', '7.5', '8', '8.5', '9', '9.5', '10', '10.5', '11', '11.5', '12', '13'],
      NOW(),
      NOW()
    );

INSERT INTO shoes (
      id, brand, name, gender, style_tags, color_tags, colorway,
      amazon_url, amazon_asin, image_url, price, retail_price, is_featured, is_active,
      view_count, click_count, favorite_count, sizes_available, created_at, updated_at
    ) VALUES (
      gen_random_uuid(),
      'Nike',
      'Pegasus 41',
      'men',
      ARRAY['running', 'performance', 'comfort'],
      ARRAY['multi'],
      'Various',
      'https://www.amazon.com/dp/B0D2Q2VQVW?tag=shoeswiper-20',
      'B0D2Q2VQVW',
      'https://m.media-amazon.com/images/I/B0D2Q2VQVW._AC_SX679_.jpg',
      140,
      140,
      true,
      true,
      2049,
      228,
      158,
      ARRAY['7', '7.5', '8', '8.5', '9', '9.5', '10', '10.5', '11', '11.5', '12', '13'],
      NOW(),
      NOW()
    );

INSERT INTO shoes (
      id, brand, name, gender, style_tags, color_tags, colorway,
      amazon_url, amazon_asin, image_url, price, retail_price, is_featured, is_active,
      view_count, click_count, favorite_count, sizes_available, created_at, updated_at
    ) VALUES (
      gen_random_uuid(),
      'Nike',
      'Pegasus 40',
      'women',
      ARRAY['running', 'comfort', 'everyday'],
      ARRAY['multi'],
      'Various',
      'https://www.amazon.com/dp/B0BQZ4X73G?tag=shoeswiper-20',
      'B0BQZ4X73G',
      'https://m.media-amazon.com/images/I/B0BQZ4X73G._AC_SX679_.jpg',
      130,
      130,
      false,
      true,
      4126,
      365,
      43,
      ARRAY['7', '7.5', '8', '8.5', '9', '9.5', '10', '10.5', '11', '11.5', '12', '13'],
      NOW(),
      NOW()
    );

INSERT INTO shoes (
      id, brand, name, gender, style_tags, color_tags, colorway,
      amazon_url, amazon_asin, image_url, price, retail_price, is_featured, is_active,
      view_count, click_count, favorite_count, sizes_available, created_at, updated_at
    ) VALUES (
      gen_random_uuid(),
      'Nike',
      'Zoom Vomero 5',
      'men',
      ARRAY['chunky', 'techwear', 'retro'],
      ARRAY['grey'],
      'Photon Dust',
      'https://www.amazon.com/dp/B0D8PWWJ2R?tag=shoeswiper-20',
      'B0D8PWWJ2R',
      'https://m.media-amazon.com/images/I/B0D8PWWJ2R._AC_SX679_.jpg',
      160,
      160,
      true,
      true,
      2667,
      239,
      148,
      ARRAY['7', '7.5', '8', '8.5', '9', '9.5', '10', '10.5', '11', '11.5', '12', '13'],
      NOW(),
      NOW()
    );

INSERT INTO shoes (
      id, brand, name, gender, style_tags, color_tags, colorway,
      amazon_url, amazon_asin, image_url, price, retail_price, is_featured, is_active,
      view_count, click_count, favorite_count, sizes_available, created_at, updated_at
    ) VALUES (
      gen_random_uuid(),
      'Nike',
      'Court Vision Low',
      'men',
      ARRAY['casual', 'clean', 'classic'],
      ARRAY['white', 'black'],
      'White/Black',
      'https://www.amazon.com/dp/B07TFQSHMD?tag=shoeswiper-20',
      'B07TFQSHMD',
      'https://m.media-amazon.com/images/I/B07TFQSHMD._AC_SX679_.jpg',
      75,
      75,
      false,
      true,
      3931,
      72,
      198,
      ARRAY['7', '7.5', '8', '8.5', '9', '9.5', '10', '10.5', '11', '11.5', '12', '13'],
      NOW(),
      NOW()
    );

INSERT INTO shoes (
      id, brand, name, gender, style_tags, color_tags, colorway,
      amazon_url, amazon_asin, image_url, price, retail_price, is_featured, is_active,
      view_count, click_count, favorite_count, sizes_available, created_at, updated_at
    ) VALUES (
      gen_random_uuid(),
      'Nike',
      'Court Vision Low',
      'women',
      ARRAY['casual', 'clean', 'everyday'],
      ARRAY['white'],
      'White',
      'https://www.amazon.com/dp/B0CZHQK1Q6?tag=shoeswiper-20',
      'B0CZHQK1Q6',
      'https://m.media-amazon.com/images/I/B0CZHQK1Q6._AC_SX679_.jpg',
      75,
      75,
      false,
      true,
      3517,
      59,
      40,
      ARRAY['7', '7.5', '8', '8.5', '9', '9.5', '10', '10.5', '11', '11.5', '12', '13'],
      NOW(),
      NOW()
    );

INSERT INTO shoes (
      id, brand, name, gender, style_tags, color_tags, colorway,
      amazon_url, amazon_asin, image_url, price, retail_price, is_featured, is_active,
      view_count, click_count, favorite_count, sizes_available, created_at, updated_at
    ) VALUES (
      gen_random_uuid(),
      'Nike',
      'Court Vision Mid',
      'women',
      ARRAY['casual', 'clean', 'classic'],
      ARRAY['white'],
      'White',
      'https://www.amazon.com/dp/B0F138FGJG?tag=shoeswiper-20',
      'B0F138FGJG',
      'https://m.media-amazon.com/images/I/B0F138FGJG._AC_SX679_.jpg',
      80,
      80,
      false,
      true,
      141,
      102,
      82,
      ARRAY['7', '7.5', '8', '8.5', '9', '9.5', '10', '10.5', '11', '11.5', '12', '13'],
      NOW(),
      NOW()
    );

INSERT INTO shoes (
      id, brand, name, gender, style_tags, color_tags, colorway,
      amazon_url, amazon_asin, image_url, price, retail_price, is_featured, is_active,
      view_count, click_count, favorite_count, sizes_available, created_at, updated_at
    ) VALUES (
      gen_random_uuid(),
      'Nike',
      'Blazer Mid 77',
      'men',
      ARRAY['vintage', 'retro', 'casual'],
      ARRAY['white', 'black'],
      'White/Black',
      'https://www.amazon.com/dp/B0949HSWCY?tag=shoeswiper-20',
      'B0949HSWCY',
      'https://m.media-amazon.com/images/I/B0949HSWCY._AC_SX679_.jpg',
      105,
      105,
      false,
      true,
      4802,
      186,
      41,
      ARRAY['7', '7.5', '8', '8.5', '9', '9.5', '10', '10.5', '11', '11.5', '12', '13'],
      NOW(),
      NOW()
    );

INSERT INTO shoes (
      id, brand, name, gender, style_tags, color_tags, colorway,
      amazon_url, amazon_asin, image_url, price, retail_price, is_featured, is_active,
      view_count, click_count, favorite_count, sizes_available, created_at, updated_at
    ) VALUES (
      gen_random_uuid(),
      'Nike',
      'Blazer Mid ''77',
      'women',
      ARRAY['vintage', 'retro', 'casual'],
      ARRAY['white', 'black'],
      'White/Black',
      'https://www.amazon.com/dp/B0BYFBJKTL?tag=shoeswiper-20',
      'B0BYFBJKTL',
      'https://m.media-amazon.com/images/I/B0BYFBJKTL._AC_SX679_.jpg',
      105,
      105,
      false,
      true,
      570,
      74,
      45,
      ARRAY['7', '7.5', '8', '8.5', '9', '9.5', '10', '10.5', '11', '11.5', '12', '13'],
      NOW(),
      NOW()
    );

INSERT INTO shoes (
      id, brand, name, gender, style_tags, color_tags, colorway,
      amazon_url, amazon_asin, image_url, price, retail_price, is_featured, is_active,
      view_count, click_count, favorite_count, sizes_available, created_at, updated_at
    ) VALUES (
      gen_random_uuid(),
      'Nike',
      'Cortez',
      'women',
      ARRAY['retro', 'classic', 'vintage'],
      ARRAY['white', 'red'],
      'White/Varsity Red',
      'https://www.amazon.com/dp/B0D1YFHNNK?tag=shoeswiper-20',
      'B0D1YFHNNK',
      'https://m.media-amazon.com/images/I/B0D1YFHNNK._AC_SX679_.jpg',
      90,
      90,
      false,
      true,
      1598,
      292,
      190,
      ARRAY['7', '7.5', '8', '8.5', '9', '9.5', '10', '10.5', '11', '11.5', '12', '13'],
      NOW(),
      NOW()
    );

INSERT INTO shoes (
      id, brand, name, gender, style_tags, color_tags, colorway,
      amazon_url, amazon_asin, image_url, price, retail_price, is_featured, is_active,
      view_count, click_count, favorite_count, sizes_available, created_at, updated_at
    ) VALUES (
      gen_random_uuid(),
      'Nike',
      'Waffle Debut',
      'women',
      ARRAY['retro', 'casual', 'vintage'],
      ARRAY['multi'],
      'Various',
      'https://www.amazon.com/dp/B09NMHN3Q2?tag=shoeswiper-20',
      'B09NMHN3Q2',
      'https://m.media-amazon.com/images/I/B09NMHN3Q2._AC_SX679_.jpg',
      75,
      75,
      false,
      true,
      2727,
      154,
      193,
      ARRAY['7', '7.5', '8', '8.5', '9', '9.5', '10', '10.5', '11', '11.5', '12', '13'],
      NOW(),
      NOW()
    );

INSERT INTO shoes (
      id, brand, name, gender, style_tags, color_tags, colorway,
      amazon_url, amazon_asin, image_url, price, retail_price, is_featured, is_active,
      view_count, click_count, favorite_count, sizes_available, created_at, updated_at
    ) VALUES (
      gen_random_uuid(),
      'Nike',
      'V2K Run',
      'women',
      ARRAY['running', 'retro', 'chunky'],
      ARRAY['multi'],
      'Various',
      'https://www.amazon.com/dp/B0CQGS72QF?tag=shoeswiper-20',
      'B0CQGS72QF',
      'https://m.media-amazon.com/images/I/B0CQGS72QF._AC_SX679_.jpg',
      110,
      110,
      false,
      true,
      566,
      427,
      97,
      ARRAY['7', '7.5', '8', '8.5', '9', '9.5', '10', '10.5', '11', '11.5', '12', '13'],
      NOW(),
      NOW()
    );

INSERT INTO shoes (
      id, brand, name, gender, style_tags, color_tags, colorway,
      amazon_url, amazon_asin, image_url, price, retail_price, is_featured, is_active,
      view_count, click_count, favorite_count, sizes_available, created_at, updated_at
    ) VALUES (
      gen_random_uuid(),
      'Jordan',
      '1 Retro High OG',
      'men',
      ARRAY['basketball', 'hypebeast', 'iconic'],
      ARRAY['multi'],
      'Various',
      'https://www.amazon.com/dp/B0DBHRM6VR?tag=shoeswiper-20',
      'B0DBHRM6VR',
      'https://m.media-amazon.com/images/I/B0DBHRM6VR._AC_SX679_.jpg',
      180,
      180,
      true,
      true,
      902,
      89,
      149,
      ARRAY['7', '7.5', '8', '8.5', '9', '9.5', '10', '10.5', '11', '11.5', '12', '13'],
      NOW(),
      NOW()
    );

INSERT INTO shoes (
      id, brand, name, gender, style_tags, color_tags, colorway,
      amazon_url, amazon_asin, image_url, price, retail_price, is_featured, is_active,
      view_count, click_count, favorite_count, sizes_available, created_at, updated_at
    ) VALUES (
      gen_random_uuid(),
      'Jordan',
      'Air Jordan 1 Low',
      'men',
      ARRAY['streetwear', 'casual', 'classic'],
      ARRAY['multi'],
      'Various',
      'https://www.amazon.com/dp/B0D5T1HXPC?tag=shoeswiper-20',
      'B0D5T1HXPC',
      'https://m.media-amazon.com/images/I/B0D5T1HXPC._AC_SX679_.jpg',
      115,
      115,
      false,
      true,
      1600,
      483,
      192,
      ARRAY['7', '7.5', '8', '8.5', '9', '9.5', '10', '10.5', '11', '11.5', '12', '13'],
      NOW(),
      NOW()
    );

INSERT INTO shoes (
      id, brand, name, gender, style_tags, color_tags, colorway,
      amazon_url, amazon_asin, image_url, price, retail_price, is_featured, is_active,
      view_count, click_count, favorite_count, sizes_available, created_at, updated_at
    ) VALUES (
      gen_random_uuid(),
      'Jordan',
      'Air Jordan 1 Low',
      'women',
      ARRAY['streetwear', 'casual', 'classic'],
      ARRAY['multi'],
      'Various',
      'https://www.amazon.com/dp/B0C3JM5YD8?tag=shoeswiper-20',
      'B0C3JM5YD8',
      'https://m.media-amazon.com/images/I/B0C3JM5YD8._AC_SX679_.jpg',
      115,
      115,
      false,
      true,
      2058,
      255,
      16,
      ARRAY['7', '7.5', '8', '8.5', '9', '9.5', '10', '10.5', '11', '11.5', '12', '13'],
      NOW(),
      NOW()
    );

INSERT INTO shoes (
      id, brand, name, gender, style_tags, color_tags, colorway,
      amazon_url, amazon_asin, image_url, price, retail_price, is_featured, is_active,
      view_count, click_count, favorite_count, sizes_available, created_at, updated_at
    ) VALUES (
      gen_random_uuid(),
      'Jordan',
      'Air Jordan 1 Mid',
      'men',
      ARRAY['streetwear', 'casual', 'classic'],
      ARRAY['multi'],
      'Various',
      'https://www.amazon.com/dp/B0DTXVK65V?tag=shoeswiper-20',
      'B0DTXVK65V',
      'https://m.media-amazon.com/images/I/B0DTXVK65V._AC_SX679_.jpg',
      135,
      135,
      false,
      true,
      4225,
      389,
      39,
      ARRAY['7', '7.5', '8', '8.5', '9', '9.5', '10', '10.5', '11', '11.5', '12', '13'],
      NOW(),
      NOW()
    );

INSERT INTO shoes (
      id, brand, name, gender, style_tags, color_tags, colorway,
      amazon_url, amazon_asin, image_url, price, retail_price, is_featured, is_active,
      view_count, click_count, favorite_count, sizes_available, created_at, updated_at
    ) VALUES (
      gen_random_uuid(),
      'Jordan',
      'Air Jordan 1 Mid',
      'women',
      ARRAY['streetwear', 'casual', 'classic'],
      ARRAY['multi'],
      'Various',
      'https://www.amazon.com/dp/B0DS6LV8BT?tag=shoeswiper-20',
      'B0DS6LV8BT',
      'https://m.media-amazon.com/images/I/B0DS6LV8BT._AC_SX679_.jpg',
      135,
      135,
      false,
      true,
      982,
      477,
      199,
      ARRAY['7', '7.5', '8', '8.5', '9', '9.5', '10', '10.5', '11', '11.5', '12', '13'],
      NOW(),
      NOW()
    );

INSERT INTO shoes (
      id, brand, name, gender, style_tags, color_tags, colorway,
      amazon_url, amazon_asin, image_url, price, retail_price, is_featured, is_active,
      view_count, click_count, favorite_count, sizes_available, created_at, updated_at
    ) VALUES (
      gen_random_uuid(),
      'Jordan',
      '1 Retro Low Satin',
      'women',
      ARRAY['streetwear', 'satin', 'premium'],
      ARRAY['multi'],
      'Various',
      'https://www.amazon.com/dp/B0DJTHZB95?tag=shoeswiper-20',
      'B0DJTHZB95',
      'https://m.media-amazon.com/images/I/B0DJTHZB95._AC_SX679_.jpg',
      140,
      140,
      false,
      true,
      2065,
      193,
      131,
      ARRAY['7', '7.5', '8', '8.5', '9', '9.5', '10', '10.5', '11', '11.5', '12', '13'],
      NOW(),
      NOW()
    );

INSERT INTO shoes (
      id, brand, name, gender, style_tags, color_tags, colorway,
      amazon_url, amazon_asin, image_url, price, retail_price, is_featured, is_active,
      view_count, click_count, favorite_count, sizes_available, created_at, updated_at
    ) VALUES (
      gen_random_uuid(),
      'Jordan',
      'Air Jordan 1 Low SE',
      'women',
      ARRAY['streetwear', 'special edition', 'premium'],
      ARRAY['multi'],
      'Various',
      'https://www.amazon.com/dp/B0DZVGK3DP?tag=shoeswiper-20',
      'B0DZVGK3DP',
      'https://m.media-amazon.com/images/I/B0DZVGK3DP._AC_SX679_.jpg',
      125,
      125,
      false,
      true,
      4828,
      419,
      102,
      ARRAY['7', '7.5', '8', '8.5', '9', '9.5', '10', '10.5', '11', '11.5', '12', '13'],
      NOW(),
      NOW()
    );

INSERT INTO shoes (
      id, brand, name, gender, style_tags, color_tags, colorway,
      amazon_url, amazon_asin, image_url, price, retail_price, is_featured, is_active,
      view_count, click_count, favorite_count, sizes_available, created_at, updated_at
    ) VALUES (
      gen_random_uuid(),
      'Jordan',
      '3 Retro',
      'men',
      ARRAY['basketball', 'iconic', 'elephant print'],
      ARRAY['multi'],
      'Various',
      'https://www.amazon.com/dp/B0DJC4C5DK?tag=shoeswiper-20',
      'B0DJC4C5DK',
      'https://m.media-amazon.com/images/I/B0DJC4C5DK._AC_SX679_.jpg',
      200,
      200,
      false,
      true,
      3126,
      53,
      112,
      ARRAY['7', '7.5', '8', '8.5', '9', '9.5', '10', '10.5', '11', '11.5', '12', '13'],
      NOW(),
      NOW()
    );

INSERT INTO shoes (
      id, brand, name, gender, style_tags, color_tags, colorway,
      amazon_url, amazon_asin, image_url, price, retail_price, is_featured, is_active,
      view_count, click_count, favorite_count, sizes_available, created_at, updated_at
    ) VALUES (
      gen_random_uuid(),
      'Jordan',
      '4 Retro',
      'men',
      ARRAY['basketball', 'hypebeast', 'chunky'],
      ARRAY['multi'],
      'Various',
      'https://www.amazon.com/dp/B0DJC5VP3Q?tag=shoeswiper-20',
      'B0DJC5VP3Q',
      'https://m.media-amazon.com/images/I/B0DJC5VP3Q._AC_SX679_.jpg',
      215,
      215,
      true,
      true,
      3514,
      215,
      93,
      ARRAY['7', '7.5', '8', '8.5', '9', '9.5', '10', '10.5', '11', '11.5', '12', '13'],
      NOW(),
      NOW()
    );

INSERT INTO shoes (
      id, brand, name, gender, style_tags, color_tags, colorway,
      amazon_url, amazon_asin, image_url, price, retail_price, is_featured, is_active,
      view_count, click_count, favorite_count, sizes_available, created_at, updated_at
    ) VALUES (
      gen_random_uuid(),
      'Jordan',
      '4 Retro',
      'women',
      ARRAY['basketball', 'chunky', 'bold'],
      ARRAY['multi'],
      'Various',
      'https://www.amazon.com/dp/B0F9FVF4BZ?tag=shoeswiper-20',
      'B0F9FVF4BZ',
      'https://m.media-amazon.com/images/I/B0F9FVF4BZ._AC_SX679_.jpg',
      215,
      215,
      true,
      true,
      3823,
      342,
      118,
      ARRAY['7', '7.5', '8', '8.5', '9', '9.5', '10', '10.5', '11', '11.5', '12', '13'],
      NOW(),
      NOW()
    );

INSERT INTO shoes (
      id, brand, name, gender, style_tags, color_tags, colorway,
      amazon_url, amazon_asin, image_url, price, retail_price, is_featured, is_active,
      view_count, click_count, favorite_count, sizes_available, created_at, updated_at
    ) VALUES (
      gen_random_uuid(),
      'Jordan',
      '11 Retro',
      'men',
      ARRAY['basketball', 'luxury', 'iconic'],
      ARRAY['multi'],
      'Various',
      'https://www.amazon.com/dp/B0DLBGPGFX?tag=shoeswiper-20',
      'B0DLBGPGFX',
      'https://m.media-amazon.com/images/I/B0DLBGPGFX._AC_SX679_.jpg',
      225,
      225,
      true,
      true,
      3834,
      361,
      194,
      ARRAY['7', '7.5', '8', '8.5', '9', '9.5', '10', '10.5', '11', '11.5', '12', '13'],
      NOW(),
      NOW()
    );

INSERT INTO shoes (
      id, brand, name, gender, style_tags, color_tags, colorway,
      amazon_url, amazon_asin, image_url, price, retail_price, is_featured, is_active,
      view_count, click_count, favorite_count, sizes_available, created_at, updated_at
    ) VALUES (
      gen_random_uuid(),
      'Jordan',
      '12 Retro',
      'men',
      ARRAY['basketball', 'luxury', 'bold'],
      ARRAY['multi'],
      'Various',
      'https://www.amazon.com/dp/B0DP61V59T?tag=shoeswiper-20',
      'B0DP61V59T',
      'https://m.media-amazon.com/images/I/B0DP61V59T._AC_SX679_.jpg',
      200,
      200,
      false,
      true,
      1799,
      282,
      96,
      ARRAY['7', '7.5', '8', '8.5', '9', '9.5', '10', '10.5', '11', '11.5', '12', '13'],
      NOW(),
      NOW()
    );

INSERT INTO shoes (
      id, brand, name, gender, style_tags, color_tags, colorway,
      amazon_url, amazon_asin, image_url, price, retail_price, is_featured, is_active,
      view_count, click_count, favorite_count, sizes_available, created_at, updated_at
    ) VALUES (
      gen_random_uuid(),
      'Jordan',
      'Spizike Low',
      'men',
      ARRAY['basketball', 'hybrid', 'bold'],
      ARRAY['multi'],
      'Various',
      'https://www.amazon.com/dp/B0DGZ7BT7R?tag=shoeswiper-20',
      'B0DGZ7BT7R',
      'https://m.media-amazon.com/images/I/B0DGZ7BT7R._AC_SX679_.jpg',
      160,
      160,
      false,
      true,
      2429,
      188,
      152,
      ARRAY['7', '7.5', '8', '8.5', '9', '9.5', '10', '10.5', '11', '11.5', '12', '13'],
      NOW(),
      NOW()
    );

INSERT INTO shoes (
      id, brand, name, gender, style_tags, color_tags, colorway,
      amazon_url, amazon_asin, image_url, price, retail_price, is_featured, is_active,
      view_count, click_count, favorite_count, sizes_available, created_at, updated_at
    ) VALUES (
      gen_random_uuid(),
      'Jordan',
      'Max Aura 5',
      'men',
      ARRAY['basketball', 'casual', 'comfort'],
      ARRAY['multi'],
      'Various',
      'https://www.amazon.com/dp/B0CMVBKJJV?tag=shoeswiper-20',
      'B0CMVBKJJV',
      'https://m.media-amazon.com/images/I/B0CMVBKJJV._AC_SX679_.jpg',
      130,
      130,
      false,
      true,
      490,
      244,
      53,
      ARRAY['7', '7.5', '8', '8.5', '9', '9.5', '10', '10.5', '11', '11.5', '12', '13'],
      NOW(),
      NOW()
    );

INSERT INTO shoes (
      id, brand, name, gender, style_tags, color_tags, colorway,
      amazon_url, amazon_asin, image_url, price, retail_price, is_featured, is_active,
      view_count, click_count, favorite_count, sizes_available, created_at, updated_at
    ) VALUES (
      gen_random_uuid(),
      'Jordan',
      'Max Aura 4',
      'women',
      ARRAY['basketball', 'casual', 'comfort'],
      ARRAY['multi'],
      'Various',
      'https://www.amazon.com/dp/B093CC4LKQ?tag=shoeswiper-20',
      'B093CC4LKQ',
      'https://m.media-amazon.com/images/I/B093CC4LKQ._AC_SX679_.jpg',
      120,
      120,
      false,
      true,
      1418,
      41,
      172,
      ARRAY['7', '7.5', '8', '8.5', '9', '9.5', '10', '10.5', '11', '11.5', '12', '13'],
      NOW(),
      NOW()
    );

INSERT INTO shoes (
      id, brand, name, gender, style_tags, color_tags, colorway,
      amazon_url, amazon_asin, image_url, price, retail_price, is_featured, is_active,
      view_count, click_count, favorite_count, sizes_available, created_at, updated_at
    ) VALUES (
      gen_random_uuid(),
      'Jordan',
      'Stay Loyal 3',
      'men',
      ARRAY['basketball', 'casual', 'modern'],
      ARRAY['multi'],
      'Various',
      'https://www.amazon.com/dp/B0D5RX5KVS?tag=shoeswiper-20',
      'B0D5RX5KVS',
      'https://m.media-amazon.com/images/I/B0D5RX5KVS._AC_SX679_.jpg',
      100,
      100,
      false,
      true,
      3793,
      66,
      109,
      ARRAY['7', '7.5', '8', '8.5', '9', '9.5', '10', '10.5', '11', '11.5', '12', '13'],
      NOW(),
      NOW()
    );

INSERT INTO shoes (
      id, brand, name, gender, style_tags, color_tags, colorway,
      amazon_url, amazon_asin, image_url, price, retail_price, is_featured, is_active,
      view_count, click_count, favorite_count, sizes_available, created_at, updated_at
    ) VALUES (
      gen_random_uuid(),
      'Jordan',
      'Stadium 90',
      'women',
      ARRAY['modern', 'casual', 'comfort'],
      ARRAY['multi'],
      'Various',
      'https://www.amazon.com/dp/B0DC6ZGC85?tag=shoeswiper-20',
      'B0DC6ZGC85',
      'https://m.media-amazon.com/images/I/B0DC6ZGC85._AC_SX679_.jpg',
      110,
      110,
      false,
      true,
      1220,
      138,
      116,
      ARRAY['7', '7.5', '8', '8.5', '9', '9.5', '10', '10.5', '11', '11.5', '12', '13'],
      NOW(),
      NOW()
    );

INSERT INTO shoes (
      id, brand, name, gender, style_tags, color_tags, colorway,
      amazon_url, amazon_asin, image_url, price, retail_price, is_featured, is_active,
      view_count, click_count, favorite_count, sizes_available, created_at, updated_at
    ) VALUES (
      gen_random_uuid(),
      'Jordan',
      'Delta 3 Low',
      'women',
      ARRAY['modern', 'lifestyle', 'comfort'],
      ARRAY['multi'],
      'Various',
      'https://www.amazon.com/dp/B0BZF531LC?tag=shoeswiper-20',
      'B0BZF531LC',
      'https://m.media-amazon.com/images/I/B0BZF531LC._AC_SX679_.jpg',
      130,
      130,
      false,
      true,
      3557,
      165,
      137,
      ARRAY['7', '7.5', '8', '8.5', '9', '9.5', '10', '10.5', '11', '11.5', '12', '13'],
      NOW(),
      NOW()
    );

INSERT INTO shoes (
      id, brand, name, gender, style_tags, color_tags, colorway,
      amazon_url, amazon_asin, image_url, price, retail_price, is_featured, is_active,
      view_count, click_count, favorite_count, sizes_available, created_at, updated_at
    ) VALUES (
      gen_random_uuid(),
      'Adidas',
      'Samba OG',
      'men',
      ARRAY['vintage', 'casual', 'timeless'],
      ARRAY['white', 'black'],
      'White/Black',
      'https://www.amazon.com/dp/B0C37GPXQ9?tag=shoeswiper-20',
      'B0C37GPXQ9',
      'https://m.media-amazon.com/images/I/B0C37GPXQ9._AC_SX679_.jpg',
      100,
      100,
      true,
      true,
      4992,
      124,
      17,
      ARRAY['7', '7.5', '8', '8.5', '9', '9.5', '10', '10.5', '11', '11.5', '12', '13'],
      NOW(),
      NOW()
    );

INSERT INTO shoes (
      id, brand, name, gender, style_tags, color_tags, colorway,
      amazon_url, amazon_asin, image_url, price, retail_price, is_featured, is_active,
      view_count, click_count, favorite_count, sizes_available, created_at, updated_at
    ) VALUES (
      gen_random_uuid(),
      'Adidas',
      'Samba OG',
      'women',
      ARRAY['vintage', 'casual', 'timeless'],
      ARRAY['white', 'black'],
      'White/Black',
      'https://www.amazon.com/dp/B0C2JXJS3M?tag=shoeswiper-20',
      'B0C2JXJS3M',
      'https://m.media-amazon.com/images/I/B0C2JXJS3M._AC_SX679_.jpg',
      100,
      100,
      true,
      true,
      1672,
      14,
      199,
      ARRAY['7', '7.5', '8', '8.5', '9', '9.5', '10', '10.5', '11', '11.5', '12', '13'],
      NOW(),
      NOW()
    );

INSERT INTO shoes (
      id, brand, name, gender, style_tags, color_tags, colorway,
      amazon_url, amazon_asin, image_url, price, retail_price, is_featured, is_active,
      view_count, click_count, favorite_count, sizes_available, created_at, updated_at
    ) VALUES (
      gen_random_uuid(),
      'Adidas',
      'Gazelle',
      'men',
      ARRAY['vintage', 'casual', 'retro'],
      ARRAY['multi'],
      'Various',
      'https://www.amazon.com/dp/B09P86BPCR?tag=shoeswiper-20',
      'B09P86BPCR',
      'https://m.media-amazon.com/images/I/B09P86BPCR._AC_SX679_.jpg',
      100,
      100,
      false,
      true,
      2260,
      10,
      175,
      ARRAY['7', '7.5', '8', '8.5', '9', '9.5', '10', '10.5', '11', '11.5', '12', '13'],
      NOW(),
      NOW()
    );

INSERT INTO shoes (
      id, brand, name, gender, style_tags, color_tags, colorway,
      amazon_url, amazon_asin, image_url, price, retail_price, is_featured, is_active,
      view_count, click_count, favorite_count, sizes_available, created_at, updated_at
    ) VALUES (
      gen_random_uuid(),
      'Adidas',
      'Gazelle',
      'women',
      ARRAY['vintage', 'casual', 'retro'],
      ARRAY['multi'],
      'Various',
      'https://www.amazon.com/dp/B0C2JY6GCT?tag=shoeswiper-20',
      'B0C2JY6GCT',
      'https://m.media-amazon.com/images/I/B0C2JY6GCT._AC_SX679_.jpg',
      100,
      100,
      false,
      true,
      1134,
      340,
      44,
      ARRAY['7', '7.5', '8', '8.5', '9', '9.5', '10', '10.5', '11', '11.5', '12', '13'],
      NOW(),
      NOW()
    );

INSERT INTO shoes (
      id, brand, name, gender, style_tags, color_tags, colorway,
      amazon_url, amazon_asin, image_url, price, retail_price, is_featured, is_active,
      view_count, click_count, favorite_count, sizes_available, created_at, updated_at
    ) VALUES (
      gen_random_uuid(),
      'Adidas',
      'Forum Low',
      'men',
      ARRAY['retro', 'basketball', 'classic'],
      ARRAY['white'],
      'White',
      'https://www.amazon.com/dp/B08745PCHW?tag=shoeswiper-20',
      'B08745PCHW',
      'https://m.media-amazon.com/images/I/B08745PCHW._AC_SX679_.jpg',
      110,
      110,
      false,
      true,
      2510,
      422,
      54,
      ARRAY['7', '7.5', '8', '8.5', '9', '9.5', '10', '10.5', '11', '11.5', '12', '13'],
      NOW(),
      NOW()
    );

INSERT INTO shoes (
      id, brand, name, gender, style_tags, color_tags, colorway,
      amazon_url, amazon_asin, image_url, price, retail_price, is_featured, is_active,
      view_count, click_count, favorite_count, sizes_available, created_at, updated_at
    ) VALUES (
      gen_random_uuid(),
      'Adidas',
      'Forum Low',
      'women',
      ARRAY['retro', 'basketball', 'classic'],
      ARRAY['white'],
      'White',
      'https://www.amazon.com/dp/B09DXWJPHY?tag=shoeswiper-20',
      'B09DXWJPHY',
      'https://m.media-amazon.com/images/I/B09DXWJPHY._AC_SX679_.jpg',
      110,
      110,
      false,
      true,
      2039,
      308,
      112,
      ARRAY['7', '7.5', '8', '8.5', '9', '9.5', '10', '10.5', '11', '11.5', '12', '13'],
      NOW(),
      NOW()
    );

INSERT INTO shoes (
      id, brand, name, gender, style_tags, color_tags, colorway,
      amazon_url, amazon_asin, image_url, price, retail_price, is_featured, is_active,
      view_count, click_count, favorite_count, sizes_available, created_at, updated_at
    ) VALUES (
      gen_random_uuid(),
      'Adidas',
      'Grand Court',
      'men',
      ARRAY['casual', 'clean', 'tennis'],
      ARRAY['white'],
      'White',
      'https://www.amazon.com/dp/B09DXW3D8B?tag=shoeswiper-20',
      'B09DXW3D8B',
      'https://m.media-amazon.com/images/I/B09DXW3D8B._AC_SX679_.jpg',
      70,
      70,
      false,
      true,
      2560,
      362,
      13,
      ARRAY['7', '7.5', '8', '8.5', '9', '9.5', '10', '10.5', '11', '11.5', '12', '13'],
      NOW(),
      NOW()
    );

INSERT INTO shoes (
      id, brand, name, gender, style_tags, color_tags, colorway,
      amazon_url, amazon_asin, image_url, price, retail_price, is_featured, is_active,
      view_count, click_count, favorite_count, sizes_available, created_at, updated_at
    ) VALUES (
      gen_random_uuid(),
      'Adidas',
      'Grand Court',
      'women',
      ARRAY['casual', 'clean', 'everyday'],
      ARRAY['white'],
      'White',
      'https://www.amazon.com/dp/B09DXW115R?tag=shoeswiper-20',
      'B09DXW115R',
      'https://m.media-amazon.com/images/I/B09DXW115R._AC_SX679_.jpg',
      70,
      70,
      false,
      true,
      1081,
      137,
      130,
      ARRAY['7', '7.5', '8', '8.5', '9', '9.5', '10', '10.5', '11', '11.5', '12', '13'],
      NOW(),
      NOW()
    );

INSERT INTO shoes (
      id, brand, name, gender, style_tags, color_tags, colorway,
      amazon_url, amazon_asin, image_url, price, retail_price, is_featured, is_active,
      view_count, click_count, favorite_count, sizes_available, created_at, updated_at
    ) VALUES (
      gen_random_uuid(),
      'Adidas',
      'Grand Court Alpha',
      'men',
      ARRAY['casual', 'modern', 'clean'],
      ARRAY['white'],
      'White',
      'https://www.amazon.com/dp/B0D2S69CWQ?tag=shoeswiper-20',
      'B0D2S69CWQ',
      'https://m.media-amazon.com/images/I/B0D2S69CWQ._AC_SX679_.jpg',
      75,
      75,
      false,
      true,
      1840,
      266,
      14,
      ARRAY['7', '7.5', '8', '8.5', '9', '9.5', '10', '10.5', '11', '11.5', '12', '13'],
      NOW(),
      NOW()
    );

INSERT INTO shoes (
      id, brand, name, gender, style_tags, color_tags, colorway,
      amazon_url, amazon_asin, image_url, price, retail_price, is_featured, is_active,
      view_count, click_count, favorite_count, sizes_available, created_at, updated_at
    ) VALUES (
      gen_random_uuid(),
      'Adidas',
      'Grand Court Tennis',
      'men',
      ARRAY['tennis', 'casual', 'sport'],
      ARRAY['white'],
      'White',
      'https://www.amazon.com/dp/B09DXVXBFR?tag=shoeswiper-20',
      'B09DXVXBFR',
      'https://m.media-amazon.com/images/I/B09DXVXBFR._AC_SX679_.jpg',
      65,
      65,
      false,
      true,
      4410,
      173,
      8,
      ARRAY['7', '7.5', '8', '8.5', '9', '9.5', '10', '10.5', '11', '11.5', '12', '13'],
      NOW(),
      NOW()
    );

INSERT INTO shoes (
      id, brand, name, gender, style_tags, color_tags, colorway,
      amazon_url, amazon_asin, image_url, price, retail_price, is_featured, is_active,
      view_count, click_count, favorite_count, sizes_available, created_at, updated_at
    ) VALUES (
      gen_random_uuid(),
      'Adidas',
      'Grand Court Tennis',
      'women',
      ARRAY['tennis', 'casual', 'clean'],
      ARRAY['white'],
      'White',
      'https://www.amazon.com/dp/B09DXVKGTW?tag=shoeswiper-20',
      'B09DXVKGTW',
      'https://m.media-amazon.com/images/I/B09DXVKGTW._AC_SX679_.jpg',
      65,
      65,
      false,
      true,
      3917,
      447,
      129,
      ARRAY['7', '7.5', '8', '8.5', '9', '9.5', '10', '10.5', '11', '11.5', '12', '13'],
      NOW(),
      NOW()
    );

INSERT INTO shoes (
      id, brand, name, gender, style_tags, color_tags, colorway,
      amazon_url, amazon_asin, image_url, price, retail_price, is_featured, is_active,
      view_count, click_count, favorite_count, sizes_available, created_at, updated_at
    ) VALUES (
      gen_random_uuid(),
      'Adidas',
      'Ultraboost',
      'men',
      ARRAY['running', 'comfort', 'performance'],
      ARRAY['black', 'white'],
      'Black/White',
      'https://www.amazon.com/dp/B0D3P29Q5C?tag=shoeswiper-20',
      'B0D3P29Q5C',
      'https://m.media-amazon.com/images/I/B0D3P29Q5C._AC_SX679_.jpg',
      190,
      190,
      true,
      true,
      1346,
      390,
      133,
      ARRAY['7', '7.5', '8', '8.5', '9', '9.5', '10', '10.5', '11', '11.5', '12', '13'],
      NOW(),
      NOW()
    );

INSERT INTO shoes (
      id, brand, name, gender, style_tags, color_tags, colorway,
      amazon_url, amazon_asin, image_url, price, retail_price, is_featured, is_active,
      view_count, click_count, favorite_count, sizes_available, created_at, updated_at
    ) VALUES (
      gen_random_uuid(),
      'Adidas',
      'Ultraboost',
      'women',
      ARRAY['running', 'comfort', 'performance'],
      ARRAY['multi'],
      'Various',
      'https://www.amazon.com/dp/B0DJV2FSHF?tag=shoeswiper-20',
      'B0DJV2FSHF',
      'https://m.media-amazon.com/images/I/B0DJV2FSHF._AC_SX679_.jpg',
      190,
      190,
      false,
      true,
      2595,
      402,
      103,
      ARRAY['7', '7.5', '8', '8.5', '9', '9.5', '10', '10.5', '11', '11.5', '12', '13'],
      NOW(),
      NOW()
    );

INSERT INTO shoes (
      id, brand, name, gender, style_tags, color_tags, colorway,
      amazon_url, amazon_asin, image_url, price, retail_price, is_featured, is_active,
      view_count, click_count, favorite_count, sizes_available, created_at, updated_at
    ) VALUES (
      gen_random_uuid(),
      'Adidas',
      'Swift Run',
      'men',
      ARRAY['running', 'casual', 'lightweight'],
      ARRAY['multi'],
      'Various',
      'https://www.amazon.com/dp/B0BHPVPF4H?tag=shoeswiper-20',
      'B0BHPVPF4H',
      'https://m.media-amazon.com/images/I/B0BHPVPF4H._AC_SX679_.jpg',
      85,
      85,
      false,
      true,
      4211,
      184,
      73,
      ARRAY['7', '7.5', '8', '8.5', '9', '9.5', '10', '10.5', '11', '11.5', '12', '13'],
      NOW(),
      NOW()
    );

INSERT INTO shoes (
      id, brand, name, gender, style_tags, color_tags, colorway,
      amazon_url, amazon_asin, image_url, price, retail_price, is_featured, is_active,
      view_count, click_count, favorite_count, sizes_available, created_at, updated_at
    ) VALUES (
      gen_random_uuid(),
      'Adidas',
      'Handball Spezial',
      'men',
      ARRAY['vintage', 'terrace', 'classic'],
      ARRAY['multi'],
      'Various',
      'https://www.amazon.com/dp/B0D7HMS8S2?tag=shoeswiper-20',
      'B0D7HMS8S2',
      'https://m.media-amazon.com/images/I/B0D7HMS8S2._AC_SX679_.jpg',
      100,
      100,
      false,
      true,
      611,
      451,
      118,
      ARRAY['7', '7.5', '8', '8.5', '9', '9.5', '10', '10.5', '11', '11.5', '12', '13'],
      NOW(),
      NOW()
    );

INSERT INTO shoes (
      id, brand, name, gender, style_tags, color_tags, colorway,
      amazon_url, amazon_asin, image_url, price, retail_price, is_featured, is_active,
      view_count, click_count, favorite_count, sizes_available, created_at, updated_at
    ) VALUES (
      gen_random_uuid(),
      'Adidas',
      'Streetalk',
      'men',
      ARRAY['streetwear', 'modern', 'bold'],
      ARRAY['multi'],
      'Various',
      'https://www.amazon.com/dp/B0DJV38CBT?tag=shoeswiper-20',
      'B0DJV38CBT',
      'https://m.media-amazon.com/images/I/B0DJV38CBT._AC_SX679_.jpg',
      90,
      90,
      false,
      true,
      2539,
      131,
      132,
      ARRAY['7', '7.5', '8', '8.5', '9', '9.5', '10', '10.5', '11', '11.5', '12', '13'],
      NOW(),
      NOW()
    );

INSERT INTO shoes (
      id, brand, name, gender, style_tags, color_tags, colorway,
      amazon_url, amazon_asin, image_url, price, retail_price, is_featured, is_active,
      view_count, click_count, favorite_count, sizes_available, created_at, updated_at
    ) VALUES (
      gen_random_uuid(),
      'Adidas',
      'Campus 00s',
      'women',
      ARRAY['retro', 'casual', 'suede'],
      ARRAY['multi'],
      'Various',
      'https://www.amazon.com/dp/B0FRYDBBHN?tag=shoeswiper-20',
      'B0FRYDBBHN',
      'https://m.media-amazon.com/images/I/B0FRYDBBHN._AC_SX679_.jpg',
      100,
      100,
      false,
      true,
      553,
      165,
      65,
      ARRAY['7', '7.5', '8', '8.5', '9', '9.5', '10', '10.5', '11', '11.5', '12', '13'],
      NOW(),
      NOW()
    );

INSERT INTO shoes (
      id, brand, name, gender, style_tags, color_tags, colorway,
      amazon_url, amazon_asin, image_url, price, retail_price, is_featured, is_active,
      view_count, click_count, favorite_count, sizes_available, created_at, updated_at
    ) VALUES (
      gen_random_uuid(),
      'Adidas',
      'Ozweego',
      'women',
      ARRAY['chunky', 'retro', 'bold'],
      ARRAY['multi'],
      'Various',
      'https://www.amazon.com/dp/B0989C9VGQ?tag=shoeswiper-20',
      'B0989C9VGQ',
      'https://m.media-amazon.com/images/I/B0989C9VGQ._AC_SX679_.jpg',
      120,
      120,
      false,
      true,
      4547,
      450,
      170,
      ARRAY['7', '7.5', '8', '8.5', '9', '9.5', '10', '10.5', '11', '11.5', '12', '13'],
      NOW(),
      NOW()
    );

INSERT INTO shoes (
      id, brand, name, gender, style_tags, color_tags, colorway,
      amazon_url, amazon_asin, image_url, price, retail_price, is_featured, is_active,
      view_count, click_count, favorite_count, sizes_available, created_at, updated_at
    ) VALUES (
      gen_random_uuid(),
      'New Balance',
      '550',
      'men',
      ARRAY['retro', 'basketball', 'trendy'],
      ARRAY['white', 'green'],
      'White/Green',
      'https://www.amazon.com/dp/B0DCX24RNV?tag=shoeswiper-20',
      'B0DCX24RNV',
      'https://m.media-amazon.com/images/I/B0DCX24RNV._AC_SX679_.jpg',
      130,
      130,
      true,
      true,
      3358,
      156,
      63,
      ARRAY['7', '7.5', '8', '8.5', '9', '9.5', '10', '10.5', '11', '11.5', '12', '13'],
      NOW(),
      NOW()
    );

INSERT INTO shoes (
      id, brand, name, gender, style_tags, color_tags, colorway,
      amazon_url, amazon_asin, image_url, price, retail_price, is_featured, is_active,
      view_count, click_count, favorite_count, sizes_available, created_at, updated_at
    ) VALUES (
      gen_random_uuid(),
      'New Balance',
      '550',
      'women',
      ARRAY['retro', 'basketball', 'trendy'],
      ARRAY['white', 'green'],
      'White/Green',
      'https://www.amazon.com/dp/B0C9W3BLT3?tag=shoeswiper-20',
      'B0C9W3BLT3',
      'https://m.media-amazon.com/images/I/B0C9W3BLT3._AC_SX679_.jpg',
      130,
      130,
      true,
      true,
      1217,
      455,
      27,
      ARRAY['7', '7.5', '8', '8.5', '9', '9.5', '10', '10.5', '11', '11.5', '12', '13'],
      NOW(),
      NOW()
    );

INSERT INTO shoes (
      id, brand, name, gender, style_tags, color_tags, colorway,
      amazon_url, amazon_asin, image_url, price, retail_price, is_featured, is_active,
      view_count, click_count, favorite_count, sizes_available, created_at, updated_at
    ) VALUES (
      gen_random_uuid(),
      'New Balance',
      '574 Core',
      'men',
      ARRAY['classic', 'casual', 'comfort'],
      ARRAY['grey'],
      'Grey',
      'https://www.amazon.com/dp/B093QJF4VR?tag=shoeswiper-20',
      'B093QJF4VR',
      'https://m.media-amazon.com/images/I/B093QJF4VR._AC_SX679_.jpg',
      90,
      90,
      false,
      true,
      4910,
      137,
      181,
      ARRAY['7', '7.5', '8', '8.5', '9', '9.5', '10', '10.5', '11', '11.5', '12', '13'],
      NOW(),
      NOW()
    );

INSERT INTO shoes (
      id, brand, name, gender, style_tags, color_tags, colorway,
      amazon_url, amazon_asin, image_url, price, retail_price, is_featured, is_active,
      view_count, click_count, favorite_count, sizes_available, created_at, updated_at
    ) VALUES (
      gen_random_uuid(),
      'New Balance',
      '574',
      'women',
      ARRAY['classic', 'casual', 'comfort'],
      ARRAY['grey'],
      'Grey',
      'https://www.amazon.com/dp/B093QK8S8R?tag=shoeswiper-20',
      'B093QK8S8R',
      'https://m.media-amazon.com/images/I/B093QK8S8R._AC_SX679_.jpg',
      90,
      90,
      false,
      true,
      3676,
      137,
      173,
      ARRAY['7', '7.5', '8', '8.5', '9', '9.5', '10', '10.5', '11', '11.5', '12', '13'],
      NOW(),
      NOW()
    );

INSERT INTO shoes (
      id, brand, name, gender, style_tags, color_tags, colorway,
      amazon_url, amazon_asin, image_url, price, retail_price, is_featured, is_active,
      view_count, click_count, favorite_count, sizes_available, created_at, updated_at
    ) VALUES (
      gen_random_uuid(),
      'New Balance',
      'FuelCell',
      'men',
      ARRAY['running', 'performance', 'speed'],
      ARRAY['multi'],
      'Various',
      'https://www.amazon.com/dp/B096NND25R?tag=shoeswiper-20',
      'B096NND25R',
      'https://m.media-amazon.com/images/I/B096NND25R._AC_SX679_.jpg',
      160,
      160,
      false,
      true,
      3884,
      394,
      42,
      ARRAY['7', '7.5', '8', '8.5', '9', '9.5', '10', '10.5', '11', '11.5', '12', '13'],
      NOW(),
      NOW()
    );

INSERT INTO shoes (
      id, brand, name, gender, style_tags, color_tags, colorway,
      amazon_url, amazon_asin, image_url, price, retail_price, is_featured, is_active,
      view_count, click_count, favorite_count, sizes_available, created_at, updated_at
    ) VALUES (
      gen_random_uuid(),
      'New Balance',
      '2002R',
      'men',
      ARRAY['retro', 'chunky', 'comfort'],
      ARRAY['multi'],
      'Various',
      'https://www.amazon.com/dp/B0FN5CXB8M?tag=shoeswiper-20',
      'B0FN5CXB8M',
      'https://m.media-amazon.com/images/I/B0FN5CXB8M._AC_SX679_.jpg',
      150,
      150,
      false,
      true,
      4717,
      259,
      182,
      ARRAY['7', '7.5', '8', '8.5', '9', '9.5', '10', '10.5', '11', '11.5', '12', '13'],
      NOW(),
      NOW()
    );

INSERT INTO shoes (
      id, brand, name, gender, style_tags, color_tags, colorway,
      amazon_url, amazon_asin, image_url, price, retail_price, is_featured, is_active,
      view_count, click_count, favorite_count, sizes_available, created_at, updated_at
    ) VALUES (
      gen_random_uuid(),
      'New Balance',
      '327',
      'men',
      ARRAY['retro', 'bold', 'casual'],
      ARRAY['multi'],
      'Various',
      'https://www.amazon.com/dp/B099TFD8W5?tag=shoeswiper-20',
      'B099TFD8W5',
      'https://m.media-amazon.com/images/I/B099TFD8W5._AC_SX679_.jpg',
      100,
      100,
      false,
      true,
      203,
      245,
      186,
      ARRAY['7', '7.5', '8', '8.5', '9', '9.5', '10', '10.5', '11', '11.5', '12', '13'],
      NOW(),
      NOW()
    );

INSERT INTO shoes (
      id, brand, name, gender, style_tags, color_tags, colorway,
      amazon_url, amazon_asin, image_url, price, retail_price, is_featured, is_active,
      view_count, click_count, favorite_count, sizes_available, created_at, updated_at
    ) VALUES (
      gen_random_uuid(),
      'New Balance',
      '327',
      'women',
      ARRAY['retro', 'bold', 'casual'],
      ARRAY['multi'],
      'Various',
      'https://www.amazon.com/dp/B0FCWDLYF3?tag=shoeswiper-20',
      'B0FCWDLYF3',
      'https://m.media-amazon.com/images/I/B0FCWDLYF3._AC_SX679_.jpg',
      100,
      100,
      false,
      true,
      4922,
      194,
      114,
      ARRAY['7', '7.5', '8', '8.5', '9', '9.5', '10', '10.5', '11', '11.5', '12', '13'],
      NOW(),
      NOW()
    );

INSERT INTO shoes (
      id, brand, name, gender, style_tags, color_tags, colorway,
      amazon_url, amazon_asin, image_url, price, retail_price, is_featured, is_active,
      view_count, click_count, favorite_count, sizes_available, created_at, updated_at
    ) VALUES (
      gen_random_uuid(),
      'New Balance',
      '530',
      'men',
      ARRAY['retro', 'running', 'chunky'],
      ARRAY['white', 'silver'],
      'White/Silver',
      'https://www.amazon.com/dp/B07B3VM8D2?tag=shoeswiper-20',
      'B07B3VM8D2',
      'https://m.media-amazon.com/images/I/B07B3VM8D2._AC_SX679_.jpg',
      100,
      100,
      false,
      true,
      363,
      199,
      65,
      ARRAY['7', '7.5', '8', '8.5', '9', '9.5', '10', '10.5', '11', '11.5', '12', '13'],
      NOW(),
      NOW()
    );

INSERT INTO shoes (
      id, brand, name, gender, style_tags, color_tags, colorway,
      amazon_url, amazon_asin, image_url, price, retail_price, is_featured, is_active,
      view_count, click_count, favorite_count, sizes_available, created_at, updated_at
    ) VALUES (
      gen_random_uuid(),
      'New Balance',
      '530',
      'women',
      ARRAY['retro', 'running', 'chunky'],
      ARRAY['white', 'silver'],
      'White/Silver',
      'https://www.amazon.com/dp/B0CQQDW6B8?tag=shoeswiper-20',
      'B0CQQDW6B8',
      'https://m.media-amazon.com/images/I/B0CQQDW6B8._AC_SX679_.jpg',
      100,
      100,
      false,
      true,
      116,
      423,
      15,
      ARRAY['7', '7.5', '8', '8.5', '9', '9.5', '10', '10.5', '11', '11.5', '12', '13'],
      NOW(),
      NOW()
    );

INSERT INTO shoes (
      id, brand, name, gender, style_tags, color_tags, colorway,
      amazon_url, amazon_asin, image_url, price, retail_price, is_featured, is_active,
      view_count, click_count, favorite_count, sizes_available, created_at, updated_at
    ) VALUES (
      gen_random_uuid(),
      'New Balance',
      '1906R',
      'unisex',
      ARRAY['retro', 'chunky', 'premium'],
      ARRAY['silver'],
      'Silver',
      'https://www.amazon.com/dp/B0C8BT9P9S?tag=shoeswiper-20',
      'B0C8BT9P9S',
      'https://m.media-amazon.com/images/I/B0C8BT9P9S._AC_SX679_.jpg',
      150,
      150,
      false,
      true,
      701,
      489,
      62,
      ARRAY['7', '7.5', '8', '8.5', '9', '9.5', '10', '10.5', '11', '11.5', '12', '13'],
      NOW(),
      NOW()
    );

INSERT INTO shoes (
      id, brand, name, gender, style_tags, color_tags, colorway,
      amazon_url, amazon_asin, image_url, price, retail_price, is_featured, is_active,
      view_count, click_count, favorite_count, sizes_available, created_at, updated_at
    ) VALUES (
      gen_random_uuid(),
      'New Balance',
      '9060',
      'women',
      ARRAY['chunky', 'futuristic', 'bold'],
      ARRAY['multi'],
      'Various',
      'https://www.amazon.com/dp/B0DSX47PJ1?tag=shoeswiper-20',
      'B0DSX47PJ1',
      'https://m.media-amazon.com/images/I/B0DSX47PJ1._AC_SX679_.jpg',
      150,
      150,
      false,
      true,
      3053,
      284,
      80,
      ARRAY['7', '7.5', '8', '8.5', '9', '9.5', '10', '10.5', '11', '11.5', '12', '13'],
      NOW(),
      NOW()
    );

INSERT INTO shoes (
      id, brand, name, gender, style_tags, color_tags, colorway,
      amazon_url, amazon_asin, image_url, price, retail_price, is_featured, is_active,
      view_count, click_count, favorite_count, sizes_available, created_at, updated_at
    ) VALUES (
      gen_random_uuid(),
      'New Balance',
      'Fresh Foam X 1080v13',
      'men',
      ARRAY['running', 'comfort', 'premium'],
      ARRAY['multi'],
      'Various',
      'https://www.amazon.com/dp/B0CNKXG21F?tag=shoeswiper-20',
      'B0CNKXG21F',
      'https://m.media-amazon.com/images/I/B0CNKXG21F._AC_SX679_.jpg',
      165,
      165,
      false,
      true,
      2855,
      118,
      120,
      ARRAY['7', '7.5', '8', '8.5', '9', '9.5', '10', '10.5', '11', '11.5', '12', '13'],
      NOW(),
      NOW()
    );

INSERT INTO shoes (
      id, brand, name, gender, style_tags, color_tags, colorway,
      amazon_url, amazon_asin, image_url, price, retail_price, is_featured, is_active,
      view_count, click_count, favorite_count, sizes_available, created_at, updated_at
    ) VALUES (
      gen_random_uuid(),
      'New Balance',
      'Fresh Foam X 880',
      'men',
      ARRAY['running', 'comfort', 'stability'],
      ARRAY['multi'],
      'Various',
      'https://www.amazon.com/dp/B0C34VNVJ6?tag=shoeswiper-20',
      'B0C34VNVJ6',
      'https://m.media-amazon.com/images/I/B0C34VNVJ6._AC_SX679_.jpg',
      140,
      140,
      false,
      true,
      3066,
      273,
      190,
      ARRAY['7', '7.5', '8', '8.5', '9', '9.5', '10', '10.5', '11', '11.5', '12', '13'],
      NOW(),
      NOW()
    );

INSERT INTO shoes (
      id, brand, name, gender, style_tags, color_tags, colorway,
      amazon_url, amazon_asin, image_url, price, retail_price, is_featured, is_active,
      view_count, click_count, favorite_count, sizes_available, created_at, updated_at
    ) VALUES (
      gen_random_uuid(),
      'New Balance',
      'Fresh Foam X 880v14',
      'women',
      ARRAY['running', 'comfort', 'stability'],
      ARRAY['multi'],
      'Various',
      'https://www.amazon.com/dp/B0CLBB3WLL?tag=shoeswiper-20',
      'B0CLBB3WLL',
      'https://m.media-amazon.com/images/I/B0CLBB3WLL._AC_SX679_.jpg',
      140,
      140,
      false,
      true,
      948,
      144,
      197,
      ARRAY['7', '7.5', '8', '8.5', '9', '9.5', '10', '10.5', '11', '11.5', '12', '13'],
      NOW(),
      NOW()
    );

INSERT INTO shoes (
      id, brand, name, gender, style_tags, color_tags, colorway,
      amazon_url, amazon_asin, image_url, price, retail_price, is_featured, is_active,
      view_count, click_count, favorite_count, sizes_available, created_at, updated_at
    ) VALUES (
      gen_random_uuid(),
      'New Balance',
      'Cross Trainer',
      'women',
      ARRAY['training', 'comfort', 'athletic'],
      ARRAY['multi'],
      'Various',
      'https://www.amazon.com/dp/B07B41SLY5?tag=shoeswiper-20',
      'B07B41SLY5',
      'https://m.media-amazon.com/images/I/B07B41SLY5._AC_SX679_.jpg',
      70,
      70,
      false,
      true,
      2642,
      78,
      24,
      ARRAY['7', '7.5', '8', '8.5', '9', '9.5', '10', '10.5', '11', '11.5', '12', '13'],
      NOW(),
      NOW()
    );

INSERT INTO shoes (
      id, brand, name, gender, style_tags, color_tags, colorway,
      amazon_url, amazon_asin, image_url, price, retail_price, is_featured, is_active,
      view_count, click_count, favorite_count, sizes_available, created_at, updated_at
    ) VALUES (
      gen_random_uuid(),
      'Converse',
      'Chuck Taylor All Star High',
      'unisex',
      ARRAY['classic', 'vintage', 'iconic'],
      ARRAY['black'],
      'Black',
      'https://www.amazon.com/dp/B000OLRWO2?tag=shoeswiper-20',
      'B000OLRWO2',
      'https://m.media-amazon.com/images/I/B000OLRWO2._AC_SX679_.jpg',
      65,
      65,
      true,
      true,
      3589,
      427,
      161,
      ARRAY['7', '7.5', '8', '8.5', '9', '9.5', '10', '10.5', '11', '11.5', '12', '13'],
      NOW(),
      NOW()
    );

INSERT INTO shoes (
      id, brand, name, gender, style_tags, color_tags, colorway,
      amazon_url, amazon_asin, image_url, price, retail_price, is_featured, is_active,
      view_count, click_count, favorite_count, sizes_available, created_at, updated_at
    ) VALUES (
      gen_random_uuid(),
      'Converse',
      'Chuck Taylor All Star',
      'women',
      ARRAY['classic', 'vintage', 'casual'],
      ARRAY['white'],
      'White',
      'https://www.amazon.com/dp/B09SBRZMLT?tag=shoeswiper-20',
      'B09SBRZMLT',
      'https://m.media-amazon.com/images/I/B09SBRZMLT._AC_SX679_.jpg',
      60,
      60,
      false,
      true,
      5034,
      41,
      51,
      ARRAY['7', '7.5', '8', '8.5', '9', '9.5', '10', '10.5', '11', '11.5', '12', '13'],
      NOW(),
      NOW()
    );

INSERT INTO shoes (
      id, brand, name, gender, style_tags, color_tags, colorway,
      amazon_url, amazon_asin, image_url, price, retail_price, is_featured, is_active,
      view_count, click_count, favorite_count, sizes_available, created_at, updated_at
    ) VALUES (
      gen_random_uuid(),
      'Converse',
      'Chuck Taylor',
      'women',
      ARRAY['classic', 'vintage', 'iconic'],
      ARRAY['multi'],
      'Various',
      'https://www.amazon.com/dp/B07BTCBV5Q?tag=shoeswiper-20',
      'B07BTCBV5Q',
      'https://m.media-amazon.com/images/I/B07BTCBV5Q._AC_SX679_.jpg',
      55,
      55,
      false,
      true,
      1853,
      327,
      172,
      ARRAY['7', '7.5', '8', '8.5', '9', '9.5', '10', '10.5', '11', '11.5', '12', '13'],
      NOW(),
      NOW()
    );

INSERT INTO shoes (
      id, brand, name, gender, style_tags, color_tags, colorway,
      amazon_url, amazon_asin, image_url, price, retail_price, is_featured, is_active,
      view_count, click_count, favorite_count, sizes_available, created_at, updated_at
    ) VALUES (
      gen_random_uuid(),
      'Vans',
      'Brooklyn Low Top',
      'men',
      ARRAY['skate', 'casual', 'streetwear'],
      ARRAY['black'],
      'Black',
      'https://www.amazon.com/dp/B0D7QC25H7?tag=shoeswiper-20',
      'B0D7QC25H7',
      'https://m.media-amazon.com/images/I/B0D7QC25H7._AC_SX679_.jpg',
      70,
      70,
      false,
      true,
      4646,
      410,
      121,
      ARRAY['7', '7.5', '8', '8.5', '9', '9.5', '10', '10.5', '11', '11.5', '12', '13'],
      NOW(),
      NOW()
    );

INSERT INTO shoes (
      id, brand, name, gender, style_tags, color_tags, colorway,
      amazon_url, amazon_asin, image_url, price, retail_price, is_featured, is_active,
      view_count, click_count, favorite_count, sizes_available, created_at, updated_at
    ) VALUES (
      gen_random_uuid(),
      'Vans',
      'Brooklyn Low Top',
      'women',
      ARRAY['skate', 'casual', 'streetwear'],
      ARRAY['black'],
      'Black',
      'https://www.amazon.com/dp/B0D7QFMK5N?tag=shoeswiper-20',
      'B0D7QFMK5N',
      'https://m.media-amazon.com/images/I/B0D7QFMK5N._AC_SX679_.jpg',
      70,
      70,
      false,
      true,
      3871,
      155,
      55,
      ARRAY['7', '7.5', '8', '8.5', '9', '9.5', '10', '10.5', '11', '11.5', '12', '13'],
      NOW(),
      NOW()
    );

INSERT INTO shoes (
      id, brand, name, gender, style_tags, color_tags, colorway,
      amazon_url, amazon_asin, image_url, price, retail_price, is_featured, is_active,
      view_count, click_count, favorite_count, sizes_available, created_at, updated_at
    ) VALUES (
      gen_random_uuid(),
      'Vans',
      'Filmore',
      'men',
      ARRAY['skate', 'casual', 'classic'],
      ARRAY['black', 'white'],
      'Black/White',
      'https://www.amazon.com/dp/B0949M2KTN?tag=shoeswiper-20',
      'B0949M2KTN',
      'https://m.media-amazon.com/images/I/B0949M2KTN._AC_SX679_.jpg',
      60,
      60,
      false,
      true,
      3064,
      380,
      136,
      ARRAY['7', '7.5', '8', '8.5', '9', '9.5', '10', '10.5', '11', '11.5', '12', '13'],
      NOW(),
      NOW()
    );

INSERT INTO shoes (
      id, brand, name, gender, style_tags, color_tags, colorway,
      amazon_url, amazon_asin, image_url, price, retail_price, is_featured, is_active,
      view_count, click_count, favorite_count, sizes_available, created_at, updated_at
    ) VALUES (
      gen_random_uuid(),
      'Vans',
      'Ashwood',
      'women',
      ARRAY['casual', 'modern', 'lifestyle'],
      ARRAY['multi'],
      'Various',
      'https://www.amazon.com/dp/B0DQ1G5ZQ3?tag=shoeswiper-20',
      'B0DQ1G5ZQ3',
      'https://m.media-amazon.com/images/I/B0DQ1G5ZQ3._AC_SX679_.jpg',
      75,
      75,
      false,
      true,
      157,
      207,
      50,
      ARRAY['7', '7.5', '8', '8.5', '9', '9.5', '10', '10.5', '11', '11.5', '12', '13'],
      NOW(),
      NOW()
    );

INSERT INTO shoes (
      id, brand, name, gender, style_tags, color_tags, colorway,
      amazon_url, amazon_asin, image_url, price, retail_price, is_featured, is_active,
      view_count, click_count, favorite_count, sizes_available, created_at, updated_at
    ) VALUES (
      gen_random_uuid(),
      'Puma',
      'Suede Classic',
      'men',
      ARRAY['retro', 'casual', 'hip-hop'],
      ARRAY['black'],
      'Black',
      'https://www.amazon.com/dp/B0D32JWHM5?tag=shoeswiper-20',
      'B0D32JWHM5',
      'https://m.media-amazon.com/images/I/B0D32JWHM5._AC_SX679_.jpg',
      75,
      75,
      false,
      true,
      3641,
      353,
      80,
      ARRAY['7', '7.5', '8', '8.5', '9', '9.5', '10', '10.5', '11', '11.5', '12', '13'],
      NOW(),
      NOW()
    );

INSERT INTO shoes (
      id, brand, name, gender, style_tags, color_tags, colorway,
      amazon_url, amazon_asin, image_url, price, retail_price, is_featured, is_active,
      view_count, click_count, favorite_count, sizes_available, created_at, updated_at
    ) VALUES (
      gen_random_uuid(),
      'Puma',
      'Suede Classic',
      'women',
      ARRAY['retro', 'casual', 'hip-hop'],
      ARRAY['multi'],
      'Various',
      'https://www.amazon.com/dp/B0D7DVSQ37?tag=shoeswiper-20',
      'B0D7DVSQ37',
      'https://m.media-amazon.com/images/I/B0D7DVSQ37._AC_SX679_.jpg',
      75,
      75,
      false,
      true,
      1682,
      360,
      136,
      ARRAY['7', '7.5', '8', '8.5', '9', '9.5', '10', '10.5', '11', '11.5', '12', '13'],
      NOW(),
      NOW()
    );

INSERT INTO shoes (
      id, brand, name, gender, style_tags, color_tags, colorway,
      amazon_url, amazon_asin, image_url, price, retail_price, is_featured, is_active,
      view_count, click_count, favorite_count, sizes_available, created_at, updated_at
    ) VALUES (
      gen_random_uuid(),
      'Puma',
      'Whispers',
      'men',
      ARRAY['modern', 'casual', 'sleek'],
      ARRAY['multi'],
      'Various',
      'https://www.amazon.com/dp/B0FBHV4RFD?tag=shoeswiper-20',
      'B0FBHV4RFD',
      'https://m.media-amazon.com/images/I/B0FBHV4RFD._AC_SX679_.jpg',
      85,
      85,
      false,
      true,
      345,
      229,
      122,
      ARRAY['7', '7.5', '8', '8.5', '9', '9.5', '10', '10.5', '11', '11.5', '12', '13'],
      NOW(),
      NOW()
    );

INSERT INTO shoes (
      id, brand, name, gender, style_tags, color_tags, colorway,
      amazon_url, amazon_asin, image_url, price, retail_price, is_featured, is_active,
      view_count, click_count, favorite_count, sizes_available, created_at, updated_at
    ) VALUES (
      gen_random_uuid(),
      'Puma',
      'Carina',
      'women',
      ARRAY['casual', 'platform', 'trendy'],
      ARRAY['white'],
      'White',
      'https://www.amazon.com/dp/B07HJRV1YQ?tag=shoeswiper-20',
      'B07HJRV1YQ',
      'https://m.media-amazon.com/images/I/B07HJRV1YQ._AC_SX679_.jpg',
      55,
      55,
      false,
      true,
      4854,
      312,
      156,
      ARRAY['7', '7.5', '8', '8.5', '9', '9.5', '10', '10.5', '11', '11.5', '12', '13'],
      NOW(),
      NOW()
    );

INSERT INTO shoes (
      id, brand, name, gender, style_tags, color_tags, colorway,
      amazon_url, amazon_asin, image_url, price, retail_price, is_featured, is_active,
      view_count, click_count, favorite_count, sizes_available, created_at, updated_at
    ) VALUES (
      gen_random_uuid(),
      'Reebok',
      'Club C Vintage',
      'men',
      ARRAY['retro', 'tennis', 'clean'],
      ARRAY['white'],
      'White',
      'https://www.amazon.com/dp/B07DPD5NS4?tag=shoeswiper-20',
      'B07DPD5NS4',
      'https://m.media-amazon.com/images/I/B07DPD5NS4._AC_SX679_.jpg',
      80,
      80,
      false,
      true,
      3846,
      177,
      106,
      ARRAY['7', '7.5', '8', '8.5', '9', '9.5', '10', '10.5', '11', '11.5', '12', '13'],
      NOW(),
      NOW()
    );

INSERT INTO shoes (
      id, brand, name, gender, style_tags, color_tags, colorway,
      amazon_url, amazon_asin, image_url, price, retail_price, is_featured, is_active,
      view_count, click_count, favorite_count, sizes_available, created_at, updated_at
    ) VALUES (
      gen_random_uuid(),
      'Reebok',
      'Classic Leather',
      'men',
      ARRAY['classic', 'retro', 'timeless'],
      ARRAY['white'],
      'White',
      'https://www.amazon.com/dp/B0971NHH8G?tag=shoeswiper-20',
      'B0971NHH8G',
      'https://m.media-amazon.com/images/I/B0971NHH8G._AC_SX679_.jpg',
      85,
      85,
      false,
      true,
      217,
      193,
      96,
      ARRAY['7', '7.5', '8', '8.5', '9', '9.5', '10', '10.5', '11', '11.5', '12', '13'],
      NOW(),
      NOW()
    );

INSERT INTO shoes (
      id, brand, name, gender, style_tags, color_tags, colorway,
      amazon_url, amazon_asin, image_url, price, retail_price, is_featured, is_active,
      view_count, click_count, favorite_count, sizes_available, created_at, updated_at
    ) VALUES (
      gen_random_uuid(),
      'Reebok',
      'Classic Leather',
      'women',
      ARRAY['classic', 'retro', 'timeless'],
      ARRAY['white'],
      'White',
      'https://www.amazon.com/dp/B092YWBZ4F?tag=shoeswiper-20',
      'B092YWBZ4F',
      'https://m.media-amazon.com/images/I/B092YWBZ4F._AC_SX679_.jpg',
      85,
      85,
      false,
      true,
      1698,
      365,
      142,
      ARRAY['7', '7.5', '8', '8.5', '9', '9.5', '10', '10.5', '11', '11.5', '12', '13'],
      NOW(),
      NOW()
    );

INSERT INTO shoes (
      id, brand, name, gender, style_tags, color_tags, colorway,
      amazon_url, amazon_asin, image_url, price, retail_price, is_featured, is_active,
      view_count, click_count, favorite_count, sizes_available, created_at, updated_at
    ) VALUES (
      gen_random_uuid(),
      'ASICS',
      'Gel-Kayano 14',
      'men',
      ARRAY['retro', 'running', 'techwear'],
      ARRAY['silver'],
      'Silver',
      'https://www.amazon.com/dp/B0CMHXJWWN?tag=shoeswiper-20',
      'B0CMHXJWWN',
      'https://m.media-amazon.com/images/I/B0CMHXJWWN._AC_SX679_.jpg',
      150,
      150,
      true,
      true,
      3607,
      257,
      156,
      ARRAY['7', '7.5', '8', '8.5', '9', '9.5', '10', '10.5', '11', '11.5', '12', '13'],
      NOW(),
      NOW()
    );

INSERT INTO shoes (
      id, brand, name, gender, style_tags, color_tags, colorway,
      amazon_url, amazon_asin, image_url, price, retail_price, is_featured, is_active,
      view_count, click_count, favorite_count, sizes_available, created_at, updated_at
    ) VALUES (
      gen_random_uuid(),
      'ASICS',
      'Gel-1130',
      'women',
      ARRAY['retro', 'running', 'chunky'],
      ARRAY['multi'],
      'Various',
      'https://www.amazon.com/dp/B0D82BRSYZ?tag=shoeswiper-20',
      'B0D82BRSYZ',
      'https://m.media-amazon.com/images/I/B0D82BRSYZ._AC_SX679_.jpg',
      120,
      120,
      false,
      true,
      388,
      245,
      80,
      ARRAY['7', '7.5', '8', '8.5', '9', '9.5', '10', '10.5', '11', '11.5', '12', '13'],
      NOW(),
      NOW()
    );

INSERT INTO shoes (
      id, brand, name, gender, style_tags, color_tags, colorway,
      amazon_url, amazon_asin, image_url, price, retail_price, is_featured, is_active,
      view_count, click_count, favorite_count, sizes_available, created_at, updated_at
    ) VALUES (
      gen_random_uuid(),
      'ASICS',
      'Gel-1130',
      'women',
      ARRAY['retro', 'running', 'techwear'],
      ARRAY['multi'],
      'Various',
      'https://www.amazon.com/dp/B0D82FZ11P?tag=shoeswiper-20',
      'B0D82FZ11P',
      'https://m.media-amazon.com/images/I/B0D82FZ11P._AC_SX679_.jpg',
      120,
      120,
      false,
      true,
      158,
      146,
      21,
      ARRAY['7', '7.5', '8', '8.5', '9', '9.5', '10', '10.5', '11', '11.5', '12', '13'],
      NOW(),
      NOW()
    );

INSERT INTO shoes (
      id, brand, name, gender, style_tags, color_tags, colorway,
      amazon_url, amazon_asin, image_url, price, retail_price, is_featured, is_active,
      view_count, click_count, favorite_count, sizes_available, created_at, updated_at
    ) VALUES (
      gen_random_uuid(),
      'On',
      'Cloud 5',
      'men',
      ARRAY['running', 'swiss', 'premium'],
      ARRAY['multi'],
      'Various',
      'https://www.amazon.com/dp/B0D31TNKHB?tag=shoeswiper-20',
      'B0D31TNKHB',
      'https://m.media-amazon.com/images/I/B0D31TNKHB._AC_SX679_.jpg',
      150,
      150,
      false,
      true,
      1453,
      423,
      33,
      ARRAY['7', '7.5', '8', '8.5', '9', '9.5', '10', '10.5', '11', '11.5', '12', '13'],
      NOW(),
      NOW()
    );

INSERT INTO shoes (
      id, brand, name, gender, style_tags, color_tags, colorway,
      amazon_url, amazon_asin, image_url, price, retail_price, is_featured, is_active,
      view_count, click_count, favorite_count, sizes_available, created_at, updated_at
    ) VALUES (
      gen_random_uuid(),
      'Brooks',
      'Ghost',
      'men',
      ARRAY['running', 'comfort', 'neutral'],
      ARRAY['multi'],
      'Various',
      'https://www.amazon.com/dp/B0DQ2BMHDW?tag=shoeswiper-20',
      'B0DQ2BMHDW',
      'https://m.media-amazon.com/images/I/B0DQ2BMHDW._AC_SX679_.jpg',
      140,
      140,
      false,
      true,
      3536,
      89,
      77,
      ARRAY['7', '7.5', '8', '8.5', '9', '9.5', '10', '10.5', '11', '11.5', '12', '13'],
      NOW(),
      NOW()
    );

INSERT INTO shoes (
      id, brand, name, gender, style_tags, color_tags, colorway,
      amazon_url, amazon_asin, image_url, price, retail_price, is_featured, is_active,
      view_count, click_count, favorite_count, sizes_available, created_at, updated_at
    ) VALUES (
      gen_random_uuid(),
      'Skechers',
      'Go Walk Max',
      'men',
      ARRAY['comfort', 'walking', 'casual'],
      ARRAY['black'],
      'Black',
      'https://www.amazon.com/dp/B072KVD3WD?tag=shoeswiper-20',
      'B072KVD3WD',
      'https://m.media-amazon.com/images/I/B072KVD3WD._AC_SX679_.jpg',
      70,
      70,
      false,
      true,
      968,
      505,
      185,
      ARRAY['7', '7.5', '8', '8.5', '9', '9.5', '10', '10.5', '11', '11.5', '12', '13'],
      NOW(),
      NOW()
    );

INSERT INTO shoes (
      id, brand, name, gender, style_tags, color_tags, colorway,
      amazon_url, amazon_asin, image_url, price, retail_price, is_featured, is_active,
      view_count, click_count, favorite_count, sizes_available, created_at, updated_at
    ) VALUES (
      gen_random_uuid(),
      'Birkenstock',
      'Boston Clog',
      'unisex',
      ARRAY['comfort', 'casual', 'classic'],
      ARRAY['brown'],
      'Brown',
      'https://www.amazon.com/dp/B004S998FW?tag=shoeswiper-20',
      'B004S998FW',
      'https://m.media-amazon.com/images/I/B004S998FW._AC_SX679_.jpg',
      160,
      160,
      false,
      true,
      1761,
      103,
      67,
      ARRAY['7', '7.5', '8', '8.5', '9', '9.5', '10', '10.5', '11', '11.5', '12', '13'],
      NOW(),
      NOW()
    );

INSERT INTO shoes (
      id, brand, name, gender, style_tags, color_tags, colorway,
      amazon_url, amazon_asin, image_url, price, retail_price, is_featured, is_active,
      view_count, click_count, favorite_count, sizes_available, created_at, updated_at
    ) VALUES (
      gen_random_uuid(),
      'Birkenstock',
      'Boston Shearling',
      'women',
      ARRAY['comfort', 'cozy', 'winter'],
      ARRAY['multi'],
      'Various',
      'https://www.amazon.com/dp/B08CRZLHLJ?tag=shoeswiper-20',
      'B08CRZLHLJ',
      'https://m.media-amazon.com/images/I/B08CRZLHLJ._AC_SX679_.jpg',
      180,
      180,
      false,
      true,
      4862,
      81,
      56,
      ARRAY['7', '7.5', '8', '8.5', '9', '9.5', '10', '10.5', '11', '11.5', '12', '13'],
      NOW(),
      NOW()
    );

INSERT INTO shoes (
      id, brand, name, gender, style_tags, color_tags, colorway,
      amazon_url, amazon_asin, image_url, price, retail_price, is_featured, is_active,
      view_count, click_count, favorite_count, sizes_available, created_at, updated_at
    ) VALUES (
      gen_random_uuid(),
      'DKNY',
      'Jaysha Heeled',
      'women',
      ARRAY['fashion', 'heeled', 'luxury'],
      ARRAY['black'],
      'Black',
      'https://www.amazon.com/dp/B0BPZWJRB4?tag=shoeswiper-20',
      'B0BPZWJRB4',
      'https://m.media-amazon.com/images/I/B0BPZWJRB4._AC_SX679_.jpg',
      130,
      130,
      false,
      true,
      2723,
      406,
      191,
      ARRAY['7', '7.5', '8', '8.5', '9', '9.5', '10', '10.5', '11', '11.5', '12', '13'],
      NOW(),
      NOW()
    );