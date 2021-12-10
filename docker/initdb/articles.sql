USE sampledb;

CREATE TABLE users (
    id INT AUTO_INCREMENT PRIMARY KEY,
    user_login_credential_id INT NOT NULL,
    user_public_profile_id INT NOT NULL,
    user_privacy_id INT NOT NULL,
    created DATETIME,
    modified DATETIME,
    UNIQUE KEY (user_login_credential_id),
    UNIQUE KEY (user_public_profile_id),
    UNIQUE KEY (user_privacy_id)
);

CREATE TABLE user_login_credentials (
    id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT NOT NULL,
    email VARCHAR(255) NOT NULL,
    password VARCHAR(255) NOT NULL,
    created DATETIME,
    modified DATETIME,
    FOREIGN KEY user_key (user_id) REFERENCES users(id),
    UNIQUE KEY (user_id)
);

CREATE TABLE user_public_profiles (
    id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT NOT NULL,
    first_name VARCHAR(255) NOT NULL,
    last_name VARCHAR(255) NOT NULL,
    created DATETIME,
    modified DATETIME,
    FOREIGN KEY user_key (user_id) REFERENCES users(id),
    UNIQUE KEY (user_id)
);

CREATE TABLE user_privacies (
    id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT NOT NULL,
    address VARCHAR(255) NOT NULL,
    created DATETIME,
    modified DATETIME,
    FOREIGN KEY user_key (user_id) REFERENCES users(id),
    UNIQUE KEY (user_id)
);

CREATE TABLE articles (
    id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT NOT NULL,
    title VARCHAR(255) NOT NULL,
    slug VARCHAR(191) NOT NULL,
    body TEXT,
    published BOOLEAN DEFAULT FALSE,
    created DATETIME,
    modified DATETIME,
    FOREIGN KEY user_key (user_id) REFERENCES users(id)
) CHARSET=utf8mb4;

CREATE TABLE tags (
    id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(191),
    created DATETIME,
    modified DATETIME,
    UNIQUE KEY (title)
) CHARSET=utf8mb4;

CREATE TABLE articles_tags (
    article_id INT NOT NULL,
    tag_id INT NOT NULL,
    PRIMARY KEY (article_id, tag_id),
    FOREIGN KEY tag_key(tag_id) REFERENCES tags(id),
    FOREIGN KEY article_key(article_id) REFERENCES articles(id)
);

INSERT INTO users (user_login_credential_id,user_public_profile_id,user_privacy_id,created, modified)
VALUES
(1,1,1,NOW(),NOW());

INSERT INTO user_login_credentials (user_id, email,password,created, modified)
VALUES
(1,'cakephp@example.com','hogehoge',NOW(),NOW());

INSERT INTO user_public_profiles (user_id, first_name,last_name,created, modified)
VALUES
(1,'katatsuke','taro',NOW(),NOW());

INSERT INTO user_privacies (user_id, address,created, modified)
VALUES
(1,'osaka',NOW(),NOW());

INSERT INTO articles (user_id, title, slug, body, published, created, modified)
VALUES
(1, 'First Post', 'first-post', 'This is the first post.', 1, now(), now());
