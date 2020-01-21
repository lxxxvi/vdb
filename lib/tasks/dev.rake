namespace :dev do
  desc "Update users discogs token from environment variable 'DISCOGS_TOKEN'"
  task set_discogs_token: :environment do
    raise '!! This may only run in development !!' unless Rails.env.development?

    discogs_token = ENV['DISCOGS_TOKEN']
    if discogs_token.blank?
      puts 'Environment variable DISCOGS_TOKEN does not exist or is empty'
      puts "Skipping\n"
    else
      puts 'Updating all users with DISCOGS_TOKEN'
      User.update_all(discogs_token: discogs_token)
      puts "Done\n"
    end
  end
end
