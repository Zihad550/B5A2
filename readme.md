1. What is PostgreSQL?
   Answer: PostgreSQL is a open-source object-relational database management system that is compatible with all major OSs and it is also highly extensible. For example we can define our own data types, build out custom functions, and even write code from different programming languages without recompiling our database.
   উত্তর: PostgreSQL হল একটি ওপেন-সোর্স অবজেক্ট-রিলেশনাল ডাটাবেস ম্যানেজমেন্ট সিস্টেম যা সমস্ত প্রধান অপারেটিং সিস্টেমের সাথে সামঞ্জস্যপূর্ণ এবং এটি অত্যন্ত এক্সটেনসিবলও। উদাহরণস্বরূপ, আমরা আমাদের নিজস্ব ডেটা টাইপ সংজ্ঞায়িত করতে পারি, কাস্টম ফাংশন তৈরি করতে পারি, এমনকি আমাদের ডাটাবেস পুনরায় কম্পাইল না করেই বিভিন্ন প্রোগ্রামিং ভাষা থেকে কোড লিখতে পারি।

3. Explain the Primary Key and Foreign Key concepts in PostgreSQL.
  - Answer:
  - Primary key: A primary key is a column or combination of columns that uniquely identifies each row in a table. It serves as the main identifier for the table. It is holds a unique and non-null value, and one table can only have one primary key. Examples:
  উত্তর:
- প্রাইমারি কী: প্রাইমারি কী হলো একটি কলাম বা কলামের সমন্বয় যা একটি টেবিলের প্রতিটি সারিকে অনন্যভাবে সনাক্ত করে। এটি টেবিলের প্রধান শনাক্তকারী হিসেবে কাজ করে। এটি একটি অনন্য এবং অ-নাল মান ধারণ করে এবং একটি টেবিলে কেবল একটি প্রাথমিক কী থাকতে পারে। উদাহরণ:
  ```sql
  -- example single column primary key
  create table users {
  id serial primary key,
  name varchar(255) not null,
  email varchar(255) not null
  }
  -- example of composite primary key
  create table drone_orders {
    order_id int,
    drone_id int,
    quantity int,
    primary key (order_id, product_id)
  }
  ```
  - Foreign key: A foreign key is a column or a combination of columns that creates a link between two tables by referencing the primary key of another table. A table can have multiple foreign keys. Examples:
  - বিদেশী কী: একটি বিদেশী কী হল একটি কলাম বা কলামের সংমিশ্রণ যা অন্য একটি টেবিলের প্রাথমিক কী উল্লেখ করে দুটি টেবিলের মধ্যে একটি লিঙ্ক তৈরি করে। একটি টেবিলে একাধিক বিদেশী কী থাকতে পারে। উদাহরণ:
  ```sql
  create table drones {
  id serial primary key,
  seller_id int not null,
  foreign key (seller_id) references sellers(id)
  }
  ```


4. What is the difference between the VARCHAR and CHAR data types?
  - Answer:
  - varchar: Varchar stores the string and only fill ups the spaces required by the actual string and it does not adds any padding for the empty spaces.
  - উত্তর:
  - varchar: varchar স্ট্রিং সংরক্ষণ করে এবং শুধুমাত্র প্রকৃত স্ট্রিংয়ের জন্য প্রয়োজনীয় স্থান পূরণ করে এবং এটি খালি স্থানগুলির জন্য কোনও প্যাডিং যোগ করে না।
  ```sql

  ```
  - char: Char stores the string and fill ups the empty spaces or length with padding.
  - char: char স্ট্রিং সংরক্ষণ করে এবং খালি স্থান বা দৈর্ঘ্য প্যাডিং দিয়ে পূরণ করে।

5. Explain the purpose of the WHERE clause in a SELECT statement.
  Answer: Where clause in select statement is used for filtering rows based on the specified conditions.
  উত্তর: যেখানে select statement-এর clause নির্দিষ্ট শর্তের উপর ভিত্তি করে সারি ফিল্টার করার জন্য ব্যবহৃত হয়।
  ```sql
  select name, email from users where age > 18;
  ```

6. What are the LIMIT and OFFSET clauses used for?
  - Limit: limits the number of rows returned from the table. For example if i have 100 users on a table I can limit the number of results returned to 50 by using limit.
  - সীমা: টেবিল থেকে ফিরে আসা সারিগুলির সংখ্যা সীমিত করে। উদাহরণস্বরূপ, যদি আমার একটি টেবিলে ১০০ জন ব্যবহারকারী থাকে তবে আমি সীমা ব্যবহার করে ফিরে আসা ফলাফলের সংখ্যা ৫০-এ সীমাবদ্ধ করতে পারি।
  ```sql
  select * from users
    limit 50;
  ```
  - Offset: Skips the number of rows defined for example if i want to return rows after nth i can use offset. Example:
  - অফসেট: নির্ধারিত সারির সংখ্যা এড়িয়ে যায়, উদাহরণস্বরূপ, যদি আমি nth এর পরে সারি ফেরত দিতে চাই, তাহলে আমি অফসেট ব্যবহার করতে পারি। উদাহরণ:
  ```sql
  -- here it's going to return users after the 50th row
  select * from users
    offset 50
  ```
