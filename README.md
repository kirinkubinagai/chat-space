#DATABASE_CREATION

##messages
  | カラム名 | 型 | オプション |
  |:---:|:---:|:---:|
  | body | text | |
  | image | string | |
  |group_id | references | foreign_key |
  |user_id | references | foreign_key |
  *belongs_to :user
  *belongs_to :group

##users
  | カラム名 | 型 | オプション |
  |:---:|:---:|:---:|
  | name | string | not null |
  | e_mail | string | unique |
  | group_id | references | foreign_key |
  | password | string | not null |
  *has_many :users_groups
  *has_many :messages
  *has_many :groups,through: :users_groups


##groups
  | カラム名 | 型 | オプション |
  |:---:|:---:|:---:|
  | name | string | not null |
  | user_id | resources | foreign_key |
  *has_many :users_groups
  *has_many :messages
  *has_many :users,through: :users_groups
