CREATE DATABASE onlineshop default charset utf8;
USE onlineshop;


CREATE TABLE `GROUP`
(
    ID         INT AUTO_INCREMENT,
    GROUP_NAME VARCHAR(50) NOT NULL,
    CONSTRAINT GROUP_PK
        PRIMARY KEY (ID)
);

CREATE TABLE STUDENT
(
    ID           INT AUTO_INCREMENT,
    GROUP_ID     INT         NOT NULL,
    FIRST_NAME   VARCHAR(50) NOT NULL,
    SECOND_NAME  VARCHAR(50) NOT NULL,
    LAST_NAME    VARCHAR(50) NOT NULL,
    BIRTHDAY_DAY VARCHAR(50) NOT NULL,
    CONSTRAINT STUDENT_PK
        PRIMARY KEY (ID),
    CONSTRAINT STUDENT_GROUP_ID_FK
        FOREIGN KEY (GROUP_ID) REFERENCES `GROUP` (ID)
            ON DELETE CASCADE
)COLLATE='utf8_unicode_ci';

select *
from `group` where GROUP_NAME;
delete from `group`;
delete from `student`;
select *
from `student`;

select concat('Group ',  g.GROUP_NAME) GROUP_NAME,
       group_concat(DISTINCT concat(s.last_name, '-', s.FIRST_NAME, '-', s.SECOND_NAME, '-',
                                    BIRTHDAY_DAY) order by s.id asc SEPARATOR ';')
    as studens
    from `group` g,
         student s
where g.ID = s.GROUP_ID
group by g.id;


commit;

set NAMES 'cp1251';
SET CHARACTER SET 'cp1251';
SET SESSION collation_connection = 'cp1251_general_ci';
alter schema students collate cp1251_general_ci;

