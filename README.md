# README

Steps to run the server: 
- git clone git@github.com:arpitjaindaiict/00a33fbef3871429173a.git
- bundle install
- rails s

sample request
```
 curl --location --request POST 'http://localhost:3000/api/sudoku' \
--header 'Content-Type: application/json' \
--header 'Cookie: __profilin=p%3Dt' \
--data-raw '{ "data":
    [
      [2, null, 5, null, null, null, 8, 6, 4],
      [null, null, null, null, null, null, 3, null, 7],
      [7, null, null, 8, 5, 6, null, 1, null],
      [4, 5, null, 7, null, null, null, null, null],
      [null, null, 9, null, null, null, 1, null, null],
      [null, null, null, null, null, 2, null, 8, 5],
      [null, 2, null, 4, 1, 8, null, null, 6],
      [6, null, 8, null, null, null, null, null, null],
      [1, null, null, 2, null, null, 7, null, 8]
    ]
}'
```

sample response
```
{"solution":[[2,1,5,3,7,9,8,6,4],[9,8,6,1,2,4,3,5,7],[7,3,4,8,5,6,2,1,9],[4,5,2,7,8,1,6,9,3],[8,6,9,5,4,3,1,7,2],[3,7,1,6,9,2,4,8,5],[5,2,7,4,1,8,9,3,6],[6,4,8,9,3,7,5,2,1],[1,9,3,2,6,5,7,4,8]]}
```
