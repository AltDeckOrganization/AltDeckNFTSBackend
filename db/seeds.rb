# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)


# Launches
launch = Launch.create(name: "3D War", profile_image_path: "/a/b/c",
  form_data: 'NFT is here', candymachine_id: "abcd", active: true,)
  
launch1 = Launch.create(name: "3D Games", profile_image_path: "/d/e/f",
  form_data: 'Blockchain', candymachine_id: "efgh", active: false,)
    
launch2 = Launch.create(name: "X-Men Wallpaper", profile_image_path: "/g/h/i",
  form_data: 'Get a copy now', candymachine_id: "ijkl", active: true,)
      

# Launchpad statistics
stats = LaunchpadStatistic.create(launch: launch, whitelist_mint_settings: "[a, b, c, d]",
  mint_price: 34, mint_currency: 345.50)

stats1 = LaunchpadStatistic.create(launch: launch1, whitelist_mint_settings: "[e, f, g, h]",
  mint_price: 44, mint_currency: 647.50555)

stats2 = LaunchpadStatistic.create(launch: launch2, whitelist_mint_settings: "[i, j, k, l]",
    mint_price: 76, mint_currency: 896.4345)