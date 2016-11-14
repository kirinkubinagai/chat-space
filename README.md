DATABASE creation

messages
| カラム名 | 型 | オプション |
|:------:|:------:|:--------:|
| body | text | not_null |
| image | string | |
|group_id | references | foreign_key |
|user_id | references | foreign_key |


users
| カラム名 | 型 | オプション |
|:------:|:------:|-------:|
| name | string | not null |
| e_mail | string | unique |
| group_id | references | foreign_key |
| password | string | not null |
*has_many :messages  
*has_many :groups,through: :messages,source: :group


groups
| カラム名 | 型 | オプション |
|:------:|:------:|:------:|
| name | string | not null |
| user_id | resources | foreign_key |
| group_id | resources | foreign_key |
*has_many :messages  
*has_many :users,through: :messages,source: :user


