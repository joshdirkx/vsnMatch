#TrueCar Assignment

To install, clone down the repository `git clone https://github.com/joshdirkx/vsnmatch`. Install bundler if you do not already have it `gem install bundler` and run `bundle install` to get required gems with dependencies. Migrate the database scheme `rake db:migrate`. Then, launch the rails console `rails c` and run the command to seed the database `Vehicle.seed_vehicle_information(‘vsn_data_noheader.csv’)`. Launch the server `rails s` and head to localhost:3000

This solution would probably begin to fail with large amounts of data. Actual VINs have the first four characters as a manufacturer code - one way to speed the process would be to first index everything within the database (assuming this is a SQL database so SWL Indexes could be used).

To my knowledge, there are no known issues for the requirements listed above (phew). The `flash[:notice]` currently moves the search box down slightly when it pops up; I would have liked it to remain stagnant and just appear when needed or remain hidden if not.

For V2 of the assignment, I think it would have been cool to have it as a single page application - as you type into the search bar the options begin to display below and remove themselves as you type more (AngularJS filter option).
