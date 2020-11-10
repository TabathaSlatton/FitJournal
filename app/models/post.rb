class Post < ApplicationRecord
    belongs_to :user
    has_many :likes, dependent: :destroy
    has_many :comments, dependent: :destroy

    def self.search(search)
        if search
            @post = Post.find_by(theme: search)
            if @post
                self.where(theme: search)
            else   
                Post.all
            end
        else  
            Post.all
        end
    end
end
