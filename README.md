# DATABASE_CREATION

##  messages
  |カラム名|型|オプション|  
  |:---:|:---:|:---:|  
  |body|text|index|  
  |image|string|index|  
  |group_id|references|foreign_key|  
  |user_id|references|foreign_key|  
  * belongs_to :user  
  * belongs_to :group  

## users
  |カラム名|型|オプション|  
  |:---:|:---:|:---:|  
  |name|string|not null,index|  
  |e_mail|string|unique,index|  
  |group_id|references|foreign_key|  
  |password|string|not null|  
  * has_many :users_groups  
  * has_many :messages  
  * has_many :groups,through: :users_groups  


## groups
  |カラム名|型|オプション|  
  |:---:|:---:|:---:|  
  |name|string|not null|  
  |user_id|references|foreign_key|  
  * has_many :users_groups  
  * has_many :messages  
  * has_many :users,through: :users_groups  

## users_groups
  |カラム名|型|オプション|  
  |:---:|:---:|:---:|  
  |user_id|references|foreign_key|  
  |groups_id|references|foreign_key|  
 * belongs_to :user  
 * belongs_to :group  
