# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)


# Launches
# launch = Launch.create(name: "3D War", profile_image_path: "/a/b/c",
#   form_data: 'NFT is here', candymachine_id: "abcd", status: :active,)
  
# launch1 = Launch.create(name: "3D Games", profile_image_path: "/d/e/f",
#   form_data: 'Blockchain', candymachine_id: "efgh", status: :pending,)
    
# launch2 = Launch.create(name: "X-Men Wallpaper", profile_image_path: "/g/h/i",
#   form_data: 'Get a copy now', candymachine_id: "ijkl", status: :completed,)

# launch3 = Launch.create(name: "Merlin Wallpaper", profile_image_path: "/m/h/i",
#   form_data: 'Here comes..', candymachine_id: "ijkl", status: :pending,)

# launch3 = Launch.create(name: "Merlin Wallpaper", profile_image_path: "/m/h/i",
#   form_data: 'Here comes..', candymachine_id: "ijkl", status: :pending,)

      

# Launchpad statistics
# stats = LaunchpadStatistic.create(launch: launch, 
#   whitelist_mint_settings: '[{"whitelist_token_price": 12, "whitelist_token_amount":11},{"whitelist_token_price": 10, "whitelist_token_amount":21}]',
#   mint_price: 34, mint_currency: 345.5000)

# stats1 = LaunchpadStatistic.create(launch: launch1, 
#   whitelist_mint_settings: '[{"whitelist_token_price": 31, "whitelist_token_amount":21},{"whitelist_token_price": 20, "whitelist_token_amount":11}]',
#   mint_price: 44, mint_currency: 647.5055)

# stats3 = LaunchpadStatistic.create(launch: launch3, 
#   whitelist_mint_settings: '[{"whitelist_token_price": 22, "whitelist_token_amount":12},{"whitelist_token_price": 12, "whitelist_token_amount":41}]',
#   mint_price: 76, mint_currency: 900.045)

# Tokens
token = Token.create(name: "Wills", date_created: "2018 Mar 03 05:12:41.211 PDT",
  date_updated: "2018 Mar 03 05:12:41.211 PDT", date_deleted: "2018 Mar 03 05:12:41.211 PDT",
  blockchain: "https://blockchain.xyz", votes: 1)

token1 = Token.create(name: "Happy", date_created: "2019 Mar 03 05:12:41.211 PDT",
    date_updated: "2019 Mar 03 05:12:41.211 PDT", date_deleted: "2019 Mar 03 05:12:41.211 PDT",
    blockchain: "https://harmony.xyz", votes: 3)

token2 = Token.create(name: "Rails", date_created: "2020 Mar 03 05:12:41.211 PDT",
    date_updated: "2020 Mar 04 05:12:41.211 PDT", date_deleted: "2020 Mar 05 05:12:41.211 PDT",
    blockchain: "https://solana.xyz", votes: 4)

# Votes
vote = Vote.create(vote_date: "2020 Mar 10 05:12:41.211 PDT", token: token)
vote1 = Vote.create(vote_date: "2021 April 11 05:12:41.211 PDT", token: token1)
vote1 = Vote.create(vote_date: "2022 May 11 05:12:41.211 PDT", token: token2)

# Category
category = Category.create(name: "category 1", token: token)
category1 = Category.create(name: "category 2", token: token1)
category2 = Category.create(name: "category 3", token: token2)

