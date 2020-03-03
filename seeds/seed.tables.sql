BEGIN;

TRUNCATE
  users,
  photos, 
  videos
  RESTART IDENTITY CASCADE;

INSERT INTO groups ("id", "name")
VALUES 
  (
    '63900ae9-3179-4a36-8e0c-a6cdddb38a28',
    'demo-group'
  );

INSERT INTO users ("id", "username", "password", "group_id")
VALUES 
  (  
    '66a91f3c-bbe9-433e-be58-cff370adef28',
    'admin',
    -- 'Password1!' using salt of 12
    '$2a$12$wc5vUYU3XuCnSqaLGVzKu.zzrR.2OTKL977bJBayXpT1bnh9qahcm',
    '63900ae9-3179-4a36-8e0c-a6cdddb38a28'
  ), 
  (
    '78cfdf03-18dd-4c9d-9f51-6d846a7aad7f',
    'phoebe',
    '$2a$12$vqIcXEcpa68Jy8O53.0ybeQ9Tx3sMSP.40gl.Y0C/JGrCRcCle4tq',
    '73e66285-e3c3-4a8c-af89-54656bdaae07'
  );
  
INSERT INTO photos("photo_url", "photo_description", "author_id", "group_id")
VALUES
  ('https://images.unsplash.com/photo-1500027014421-46ccc843776a?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=634&q=80', 'two friends walking with side hug', '66a91f3c-bbe9-433e-be58-cff370adef28', '63900ae9-3179-4a36-8e0c-a6cdddb38a28'),
  ('https://images.unsplash.com/photo-1451471016731-e963a8588be8?ixlib=rb-1.2.1&auto=format&fit=crop&w=1352&q=80', 'two kids walking together', '66a91f3c-bbe9-433e-be58-cff370adef28', '63900ae9-3179-4a36-8e0c-a6cdddb38a28'),
  ('https://images.unsplash.com/photo-1505535162959-9bbcb4ab22d6?ixlib=rb-1.2.1&auto=format&fit=crop&w=1341&q=80', 'two people smiling and covering each others eyes', '66a91f3c-bbe9-433e-be58-cff370adef28', '63900ae9-3179-4a36-8e0c-a6cdddb38a28'),
  ('https://images.unsplash.com/photo-1534957753291-64d667ce2927?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1489&q=80', 'friends making a heart over a sunflower field', '66a91f3c-bbe9-433e-be58-cff370adef28', '63900ae9-3179-4a36-8e0c-a6cdddb38a28'),
  ('https://images.unsplash.com/photo-1508904635850-d986b19765d0?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=634&q=80', 'a silhouette of three friends at the beach', '66a91f3c-bbe9-433e-be58-cff370adef28', '63900ae9-3179-4a36-8e0c-a6cdddb38a28'),
  ('https://images.unsplash.com/photo-1473679408190-0693dd22fe6a?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1350&q=80', 'a shihouette of two people sitting together', '66a91f3c-bbe9-433e-be58-cff370adef28', '63900ae9-3179-4a36-8e0c-a6cdddb38a28'),
  ('https://images.unsplash.com/photo-1496516348160-24b35a31856f?ixlib=rb-1.2.1&auto=format&fit=crop&w=634&q=80', 'peoples shoes while sitting on a wall', '66a91f3c-bbe9-433e-be58-cff370adef28', '63900ae9-3179-4a36-8e0c-a6cdddb38a28'),
  ('https://unsplash.com/photos/71u2fOofI-U', 'people cheering with coffee', '66a91f3c-bbe9-433e-be58-cff370adef28', '63900ae9-3179-4a36-8e0c-a6cdddb38a28'),
  ('https://unsplash.com/photos/Qg6lPXJ6IL4', 'sign that says we like you too', '66a91f3c-bbe9-433e-be58-cff370adef28', '63900ae9-3179-4a36-8e0c-a6cdddb38a28'),
  ('https://images.unsplash.com/photo-1528739146320-61d4c9f46eb0?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1350&q=80', 'two girls cover their face with bouqets of flowers in a flower field', '66a91f3c-bbe9-433e-be58-cff370adef28', '63900ae9-3179-4a36-8e0c-a6cdddb38a28'),
  ('https://images.unsplash.com/photo-1564947876383-bf9ea2f9742e?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=634&q=80', 'woman rides longboard', '66a91f3c-bbe9-433e-be58-cff370adef28', '63900ae9-3179-4a36-8e0c-a6cdddb38a28');

INSERT INTO videos ("video_url", "video_title", "video_description", "author_id", "group_id")
VALUES 
  ('https://www.youtube.com/embed/v=dQw4w9WgXcQ', 'Best Song Ever', 'Believe it', '66a91f3c-bbe9-433e-be58-cff370adef28', '63900ae9-3179-4a36-8e0c-a6cdddb38a28'),
  ('https://www.youtube.com/embed/cvh0nX08nRw', 'Even Better', null, '66a91f3c-bbe9-433e-be58-cff370adef28', '63900ae9-3179-4a36-8e0c-a6cdddb38a28'),
  
INSERT INTO letters ("title", "content", "author_id", "group_id") 
VALUES 
  ('GREETINGS', 'Hi, thanks for checking out this website. \n If you read the README file on GitHub, you''ll know that this website was created as a gift for a friend of mine that is moving out of the country that I won''t get to see very much anymore. We grew up in the age of Facebook and obnoxiously posted about our friendship often. When I swore off Facebook my side of those memories disappeared. I wanted to make a scrapbook of sorts for her, one that she wouldn''t need to physically carry. I logged on to Facebook one last time, pulled what I needed, and posted it here. \n If I''m not sharing my data with Facebook, naturally you won''t get that intimate access to my photos either. This is a demo account just to show what I built. It''s intentionally simple and not interactive as it was created to be a personal website, something of a homecooked meal that I can take pictures and even share the recipe, but you won''t get to try the meat. Hope it encourages you to "cook" for those you love.', '78cfdf03-18dd-4c9d-9f51-6d846a7aad7f', '73e66285-e3c3-4a8c-af89-54656bdaae07');

COMMIT;