<img width="100" alt="Screen Shot 2023-06-03 at 6 31 28 AM" src="https://user-images.githubusercontent.com/90228086/243080678-8d210321-2d8a-4bd4-bf70-6911faf06606.png">

# Fly.io Link
- https://patch-perfect.fly.dev/


# Link to database repo
https://github.com/WadeNaughton/patch_perfect_db

# What is this?

- A hiking site centered around finding and recording peaks within the White Mountains that are above 4000 feet in elevation. Users have the ability to search or browse the peak, and then mark a peak as either completed or favorited. A peak marked as completed allows the user to build a digital journal entry of sorts to keep track of any pictures/notes from the trip. Users can also add others to the trip report, which adds a level of collaboration if desired. Each peak page allows the user to obtain directions, current weather, hourly weather, forecast for the week, as well as find campgrounds within a radius of their choosing. 

# Why make this? 

- I found myself spending many hours sifting through old backpacking pictures and trying to remember what I was doing or how I was feeling in those moments. I realized it became hard to pin point those feelings when so much time had passed. I took this feeling and decided to make a digital journal for myself, in order to better keep track of my pictures and notes. After talking to friends it became clear that making these journal entries coloborative would be fun for our whole group. Now, whenever I make my way up to the White Mountains, we can add our pictures and notes as soon as we regain service. 


# Features

- create user account
- discover all peaks above 4000 feet
- favorite a hike
- mark a hike as completed
- add journal entries and photos to a completed hike
- add comments and pictures to hikes for other users to see
- add gear used for the completed hike
- calculate your total weight for a trip
- add other users to your trip
- directions to each hike
- find national forest campgrounds within 20 miles of the hike
- get directions to each campground
- links to make reservations to the campgrounds
- current, hourly, and daily weather for each peak
- upload profile picutre 
- users that have been added to a trip can upload their photos to the trip report
- add costs associated with the trip and have that cost be evenly split


# Features to come


- enhanced logic for splitting costs
- enhanced design
- imporoved schema design
- expand to peaks in Virginia/West Virginia/DMV area


![-----------------------------------------------------](https://raw.githubusercontent.com/andreasbm/readme/master/assets/lines/rainbow.png)

## <div align="center">API endpoints</div>

<details close="close">
  <summary>Hikes endpoint</summary>

  ```
  https://patch-perfect-datasource.fly.dev/api/v1/hikes
  ```
  ```
  data": [
        {
            "id": "1",
            "type": "hike",
            "attributes": {
                "id": 1,
                "name": "Washington",
                "elevation": 6288,
                "prominence": 6138,
                "state": "NH",
                "location": "Pinkham's Grant",
                "range": "Presidential Range",
                "features": "Waterfalls, Cascades, Brooks, Lakes of the Clouds Hut + Lakes, 360 Degree Views, Peak Bagging",
                "latitude": 44.270278,
                "longitude": -71.303611
            }
        },
 ```
  
  </details>

<details close="close">
  <summary>Single Hike Endpoint</summary>
  
  ```
  https://patch-perfect-datasource.fly.dev/api/v1/hikes/3
  ```
  
  ```
  {
    "data": {
        "id": "3",
        "type": "hike",
        "attributes": {
            "id": 3,
            "name": "Jefferson",
            "elevation": 5712,
            "prominence": 742,
            "state": "NH",
            "location": "Thompson and Meserves Purchase",
            "range": "Presidential Range",
            "features": "Cascades, Rock Scrambles, Alpine Zone, 360 Degree Views, Peak Bagging",
            "latitude": 44.304167,
            "longitude": -71.316944
        }
    }
}
```
   </details>

<details close="close">
  <summary>Search Endpoint</summary>
  
 ``` 
 https://patch-perfect-datasource.fly.dev/api/v1/search?search=adams
```
  
 ```
  {
    "data": [
        {
            "id": "2",
            "type": "hike",
            "attributes": {
                "id": 2,
                "name": "Adams",
                "elevation": 5774,
                "prominence": 804,
                "state": "NH",
                "location": " Thompson and Meserves Purchase",
                "range": "Presidential Range",
                "features": "Rock Scrambles, Mossy Falls, Madison Spring Hut, Ice Caves, 360 degree views on a clear day, Alpine Zone, Star Lake, Peak Bagging",
                "latitude": 44.320556,
                "longitude": -71.291389
            }
        }
    ]
}
```
  
  </details>
  
  ## <div align="center">Overview</div>


#### Framework:
<p>
  <img src="https://img.shields.io/badge/Ruby%20On%20Rails-b81818.svg?&style=flat&logo=rubyonrails&logoColor=white" />
</p>

#### Languages:
<p>
  <img src="https://img.shields.io/badge/Ruby-CC0000.svg?&style=flaste&logo=ruby&logoColor=white" />
  <img src="https://img.shields.io/badge/ActiveRecord-CC0000.svg?&style=flaste&logo=rubyonrails&logoColor=white" />
</p>

#### Tools:
<p>
  <img src="https://img.shields.io/badge/Git-F05032.svg?&style=flaste&logo=git&logoColor=white" />
  <img src="https://img.shields.io/badge/GitHub-181717.svg?&style=flaste&logo=github&logoColor=white" />
  <img src="https://img.shields.io/badge/Postman-FF6E4F.svg?&style=flat&logo=postman&logoColor=white" />
</p>

#### Development Principles:
<p>
  <img src="https://img.shields.io/badge/OOP-b81818.svg?&style=flaste&logo=OOP&logoColor=white" />
  <img src="https://img.shields.io/badge/TDD-b87818.svg?&style=flaste&logo=TDD&logoColor=white" />
  <img src="https://img.shields.io/badge/MVC-b8b018.svg?&style=flaste&logo=MVC&logoColor=white" />
  <img src="https://img.shields.io/badge/REST-33b818.svg?&style=flaste&logo=REST&logoColor=white" />  
</p>
