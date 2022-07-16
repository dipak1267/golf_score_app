# anques_interview_task

A Flutter Task for freshers.


Task : Golf

Below is your task according to experience. Please try to solve point-wise so that we can know if you stuck on any point.
You are free to ask us if anything not understandable. Keep your code clean (as we will judge you through your coding too)


PLEASE TRY TO USE ANY STATE MANAGEMENT APPROACH.


Task Timing : 5 hours

1)Create splash screen. Afterwards perform below action and display data on another screen.

2)Call the below api to get json data:
with PUT method:
https://practical.demo4site.com/dev4/api/practical/?method=golf
with request(in body):
{
    "data": [
        {
            "match_id": "59"
        }
    ]
}

3)Get players score and display according to the object 

3)On clicking previous or next, display the previous or next object data from an array

4)On clicking next on 18th hole, display data of 1st object

5)On clicking previous on 1st hole, display data of 18th object

6)Change score of player on clicking (-) or (+)

7)Store updated score of players on clicking on next by calling below url  with PUT method:
http://php.demo4work.com/api/practical/?method=golf
request :
{
"data": [
{
    "holeNumber": "2",
    "hole_id": "101",
    "players": [
            {
                "firstName": "Nick",
                "lastName": "Leviton",
                "player_id": "4",
                "default_score": "15"
            },
            {
                "firstName": "Jeff",
                "lastName": "Hudson",
                "player_id": "13",
                "default_score": "15"
            },
            {
                "firstName": "Barry",
                "lastName": "Pearce",
                "player_id": "14",
                "default_score": "15"
            },
            {
                "firstName": "Graham",
                "lastName": "Piper",
                "player_id": "15",
                "default_score": "15"
            }
        ]
    }
]
}


8)If data updated successfully, display updated data when clicked previous

Happy Coding!