########################################################
# Step 1: Establish the layers

# In this section of the file, as a series of comments,
# create a list of the layers you identify.
# - layer 1: list of rides
# - layer 2: information about each ride
# Which layers are nested in each other?
# - information of each ride is part of list of rides
# Which layers of data "have" within it a different layer?
# - each ride have data about driver id, date, cost, rider id and rating
# Which layers are "next" to each other?
# id, date, cost, rider id and rating are next to each other

########################################################
# Step 2: Assign a data structure to each layer
# - Layer 1: array of trips
# - Layer 2: hash with key value pairs; where key is the header of the table and value is the data in a cell

########################################################
# Step 3: Make the data structure!
#
rides = [
    {
        driver_id: "DR0004",
        date: "3rd Feb 2016",
        cost: 5,
        rider_id: "RD0022",
        rating: 5
    },
    {
        driver_id: "DR0001",
        date: "3rd Feb 2016",
        cost: 10,
        rider_id: "RD0003",
        rating: 3
    },
    {
        driver_id: "DR0002",
        date: "3rd Feb 2016",
        cost: 25,
        rider_id: "RD0073",
        rating: 5
    },

    {
        driver_id: "DR0001",
        date: "3rd Feb 2016",
        cost: 30,
        rider_id: "RD0015",
        rating: 4
    },

    {
        driver_id: "DR0003",
        date: "4th Feb 2016",
        cost: 5,
        rider_id: "RD0066",
        rating: 5
    },

    {
        driver_id: "DR0004",
        date: "4th Feb 2016",
        cost: 10,
        rider_id: "RD0022",
        rating: 4
    },

    {
        driver_id: "DR0002",
        date: "4th Feb 2016",
        cost: 15,
        rider_id: "RD0013",
        rating: 1
    },

    {
        driver_id: "DR0003",
        date: "5th Feb 2016",
        cost: 50,
        rider_id: "RD0003",
        rating: 2
    },

    {
        driver_id: "DR0002",
        date: "5th Feb 2016",
        cost: 35,
        rider_id: "RD0066",
        rating: 3
    },

    {
        driver_id: "DR0004",
        date: "5th Feb 2016",
        cost: 20,
        rider_id: "RD0073",
        rating: 5
    },

    {
        driver_id: "DR0001",
        date: "5th Feb 2016",
        cost: 45,
        rider_id: "RD0003",
        rating: 2
    }
]

########################################################
# Step 4: Total Driver's Earnings and Number of Rides
# Use an iteration blocks to print the following answers:

def driver_info(rides, driver)
  # creating the array of hashes with all rides for each driver
  driver_rides = []
  rides.each do |ride|
    if ride[:driver_id] == driver
      driver_rides << ride
    end
  end

  #calculating the summary of costs of all rides for each driver
  driver_earned = 0
  driver_rides.each do |ride|
    driver_earned += ride[:cost]
  end

  #calcualting the average rating for each driver, reusing driver_rides array
  driver_rating_summary = 0
  driver_rides.each do |ride|
    driver_rating_summary += ride[:rating]
  end
  average_rating = driver_rating_summary.to_f / driver_rides.length
  return {driver_id: driver, earned: driver_earned, average_rating: average_rating, rides: driver_rides.length}
end

#iterates through the array driver_infos and calling the method for each driver id with calculations
all_drivers_ids = ["DR0001", "DR0002", "DR0003", "DR0004"]
driver_infos = all_drivers_ids.map {|id| driver_info(rides, id)}

# - the number of rides each driver has given
driver_infos.each {|info| puts "The driver #{info[:driver_id]} has given: #{info[:rides]} rides."}

# - the total amount of money each driver has made
driver_infos.each {|info| puts "The total amount of money driver #{info[:driver_id]} has made: #{info[:earned]}"}

# - the average rating for each driver
driver_infos.each {|info| puts "The average rating for driver #{info[:driver_id]} is: #{info[:average_rating]}"}

# - Which driver made the most money?
driver_id_earned_max = driver_infos.max { |driver1, driver2| driver1[:earned] <=> driver2[:earned] }
puts "Driver #{driver_id_earned_max[:driver_id]} made the most money."

# - Which driver has the highest average rating?
driver_with_max_ave_rating = driver_infos.max { |driver1, driver2| driver1[:average_rating] <=> driver2[:average_rating] }
puts "Driver #{driver_with_max_ave_rating[:driver_id]} has the highest average rating."

