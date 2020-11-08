class AddDefaultToUserProfileImgUrl < ActiveRecord::Migration[6.0]
  def change
    change_column_default :users, :profile_img_url, "https://moonvillageassociation.org/wp-content/uploads/2018/06/default-profile-picture1.jpg"
  end
end
