class Novel < ApplicationRecord

	belongs_to :user
	has_many :comments, dependent: :destroy
	has_many :favorites, dependent: :destroy
        def favorited_by?(user)
          favorites.where(user_id: user.id).exists?
        end

	validates :title, presence: true
	validates :body, presence: true
	validates :caption, presence: true

	enum genre: {
		未選択: 0,
		恋愛: 1,
		ミステリー: 2,
		歴史: 3,
		SF: 4,
		ファンタジー: 5,
		コメディ: 6,
		ホラー: 7,
		詩歌: 8,
		エッセイ: 9,
		その他: 10
	}

end
