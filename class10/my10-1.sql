-- 시도 1: 중복 ISBN 입력
INSERT INTO book (title, author_id, price, isbn)
VALUES ('또 다른 책', 1, 15000, 'ISBN-001');

-- 시도 2: isbn 에 NULL 입력
INSERT INTO book (title, author_id, price, isbn)
VALUES ('염리는 책', 2, 18000, NULL);

CREATE TABLE review (
    review_id  INT      PRIMARY KEY AUTO_INCREMENT,
    book_id    INT      NOT NULL,
    author_id  INT      NOT NULL,
    rating     INT      NOT NULL,
    content    TEXT     NOT NULL,
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (book_id)   REFERENCES book(book_id),
    FOREIGN KEY (author_id) REFERENCES author(author_id)
);