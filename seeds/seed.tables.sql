BEGIN;

TRUNCATE
  users,
  photos, 
  videos
  RESTART IDENTITY CASCADE;

INSERT INTO users ('id', 'username', 'password', 'group_id')
VALUES 
  (  
    'admin',
    -- 'Password1!' using salt of 12
    '$2a$12$wc5vUYU3XuCnSqaLGVzKu.zzrR.2OTKL977bJBayXpT1bnh9qahcm',
    '66a91f3c-bbe9-433e-be58-cff370adef28',
    -- demo group ID
    '63900ae9-3179-4a36-8e0c-a6cdddb38a28'
  ), 
    (
    'phoebe',
    -- 'n1cklesNdimes!' using a salt of 12
    '$2a$12$vqIcXEcpa68Jy8O53.0ybeQ9Tx3sMSP.40gl.Y0C/JGrCRcCle4tq',
    '78cfdf03-18dd-4c9d-9f51-6d846a7aad7f',
    -- hannah and phoebe group ID
    '73e66285-e3c3-4a8c-af89-54656bdaae07'
  ),
  (
    'hannah',
    -- 'S1lverlunchtruck' using salt of 12
    '$2a$12$V1Ki7esAhNCzdUrvW3GaBezgof.j9B6fPYj7oQMEGLbFklG4Hx/Y2',
    '4dee694f-3259-4be5-b85e-e6cbcec737f1',
    -- hannah and phoebe group ID
    '73e66285-e3c3-4a8c-af89-54656bdaae07'
  )
  
INSERT INTO photos('photo_url', 'photo_description', 'user_id', 'group_id')
VALUES
  -- demo account photos
  ('https://via.placeholder.com/400', 'placeholder image', '66a91f3c-bbe9-433e-be58-cff370adef28', '63900ae9-3179-4a36-8e0c-a6cdddb38a28'),
  ('https://via.placeholder.com/400', 'placeholder image', '66a91f3c-bbe9-433e-be58-cff370adef28', '63900ae9-3179-4a36-8e0c-a6cdddb38a28'),
  ('https://via.placeholder.com/600', 'placeholder image', '66a91f3c-bbe9-433e-be58-cff370adef28', '63900ae9-3179-4a36-8e0c-a6cdddb38a28'),
  ('https://via.placeholder.com/400x600', 'placeholder image', '66a91f3c-bbe9-433e-be58-cff370adef28', '63900ae9-3179-4a36-8e0c-a6cdddb38a28'),
  ('https://via.placeholder.com/600', 'placeholder image', '66a91f3c-bbe9-433e-be58-cff370adef28', '63900ae9-3179-4a36-8e0c-a6cdddb38a28'),
  ('https://via.placeholder.com/600', 'placeholder image', '66a91f3c-bbe9-433e-be58-cff370adef28', '63900ae9-3179-4a36-8e0c-a6cdddb38a28'),
  ('https://via.placeholder.com/600x400', 'placeholder image', '66a91f3c-bbe9-433e-be58-cff370adef2', '63900ae9-3179-4a36-8e0c-a6cdddb38a28'),
  ('https://via.placeholder.com/600', 'placeholder image', '66a91f3c-bbe9-433e-be58-cff370adef28', '63900ae9-3179-4a36-8e0c-a6cdddb38a28'),
  ('https://via.placeholder.com/400x600', 'placeholder image', '66a91f3c-bbe9-433e-be58-cff370adef2', '63900ae9-3179-4a36-8e0c-a6cdddb38a28'),
  ('https://via.placeholder.com/400x500', 'placeholder image', '66a91f3c-bbe9-433e-be58-cff370adef2', '63900ae9-3179-4a36-8e0c-a6cdddb38a28'),
  ('https://via.placeholder.com/700x600', 'placeholder image', '66a91f3c-bbe9-433e-be58-cff370adef2', '63900ae9-3179-4a36-8e0c-a6cdddb38a28');
  -- remove semi-colon above and add hannah and pb videos here

INSERT INTO videos ('video_url', 'video_title', 'video_description', 'user_id', 'group_id')
VALUES 
  -- demo account videos
  ('https://www.youtube.com/watch?v=dQw4w9WgXcQ', 'Best Song Ever', 'Believe it', '66a91f3c-bbe9-433e-be58-cff370adef2', '63900ae9-3179-4a36-8e0c-a6cdddb38a28'),
  ('https://www.youtube.com/watch?v=cvh0nX08nRw', 'Even Better', '', '66a91f3c-bbe9-433e-be58-cff370adef2', '63900ae9-3179-4a36-8e0c-a6cdddb38a28'),
  -- hannah and pb videos
    ("https://www.youtube.com/embed/tncd3K2qsfQ", "Happy Birthday Hannah (2010)", "", "78cfdf03-18dd-4c9d-9f51-6d846a7aad7f", '73e66285-e3c3-4a8c-af89-54656bdaae07'),
    ("https://youtube.com/embed/snnC-LT8sn4", "Happy Birthday Hannah (2011)", "", "78cfdf03-18dd-4c9d-9f51-6d846a7aad7f", '73e66285-e3c3-4a8c-af89-54656bdaae07'),
    ("https://www.youtube.com/embed/GWjedyCMm3Y", "Happy Birthday Hannah (2014)", "", "78cfdf03-18dd-4c9d-9f51-6d846a7aad7f", '73e66285-e3c3-4a8c-af89-54656bdaae07');
