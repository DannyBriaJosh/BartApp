# BartApp

BartApp is a Bay Area Bart commuter application for iOS. The app is able to chose a range of train times for the user based on a given start, end location and a desired time to leave. Users are then able to select the train time they plan to use and are able to see a map view of their current location, departure station, transfer station(s), and arrival station. The application will also utilize geofencing to alert users when their stop is coming soon to ensure they are ready to get off the train. 

## MVP User Stories

- [ ] Intakes starting location, ending location, and desired leave time.
- [ ] Gives user best timed Bart train.
- [ ] Gives user other well timed Bart trains.
- [ ] User able to select a route option and sees a map view of current location, departure station, arrival station, transfer stations, and train stops.
- [ ] Notification alarm when user within certain distance from tranfer/destination location. (Note: Cannot access Alarm app.)

## Optional User Stories

- [ ] Authenticating users for data tracking.
- [ ] See full schedule of train times.
- [ ] Ability to enter a desired arrival time when searching for train schedules.
- [ ] Rider advisory notifications.
- [ ] Caltrain functionality.
- [ ] Caltrain reminder to tap on/off.
- [ ] Save common locations (work,home,etc).
- [ ] Factor in time to train stop.
- [ ] Send reminder of when to leave.

## Wireframes
wireframes.png


## Specs
Choose destination (Bria):
Required
- Choose starting station
- Choose destination station
- Select time
- Setup station data
- Pass start station, destination station, and time
Optionals:
- Closest station to current location (starting and end)
- Enter custom address
- Select arrival time
- Autopopulate when going back to home screen

Select route (Danny):
- Display trips and transfers
- Display trip times
- GET request to retrieve list
- Ability to select trips
- Pass two station objects and time
Optionals:
- Real time updates

Map (Josh):
- Show stations on map (start, transfers, end)
- Display estimated ETA
- Setup geofencing for every station
- Send local notification with sound
Optionals:
- Trace route

Project Optionals:
- Save favorite stations and routes
- Lose service notification
- Cancel trip based on time
- Theme manager


## License

    Copyright [yyyy] [name of copyright owner]

    Licensed under the Apache License, Version 2.0 (the "License");
    you may not use this file except in compliance with the License.
    You may obtain a copy of the License at

        http://www.apache.org/licenses/LICENSE-2.0

    Unless required by applicable law or agreed to in writing, software
    distributed under the License is distributed on an "AS IS" BASIS,
    WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
    See the License for the specific language governing permissions and
    limitations under the License.
