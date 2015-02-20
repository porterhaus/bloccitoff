namespace :todo do
  desc "Delete items that are older than seven days"
  task delete_items: :environment do
    Item.where("created_at <= ?", Time.now - 7.day).destroy_all
  end
end
