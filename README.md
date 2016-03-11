Live server: http://lineserver.herokuapp.com/
## Usage:
If you dont have rails/ruby/mongo install  and you are in linux lubuntu, you can run:
 sh build.sh

 else youalready have everythin install and just need the lib dependency run:
 bundle install

 to run the app:
 through regular single process rails:
 rails server
 or run with unicorn multi proceess:
 sh run.sh

## Describtion on this project:

### How does your system work?
I used Ruby on Rails MVC framework for this project.  First, I used scaffold to generate CRUD of input_file. Then I added routes and controllers to handle request to display the lines by id. I also included an upload file functionality, the algorithm parse and loads the text into mongo db. The reason to use a db is to improve lookup performance, without reading the entire file every time to search for a line. My db includes an index on the line, which help lookup performance since its read only. 

### How will your system perform with a 1 GB file? a 10 GB file? a 100 GB file?
MY program will delete the existing file before uploading. There will be a onetime cost of O(nx) delete the old file and a onetime cost of O(n) to parse and load the new file into the db. Mongo has the ablity to distribute the db when the size it too large. 
Since the “line” lookup is determined by the db implementation, without indexing the search can take O(n) to scan through all lines. With default b-tree indexing, it takes O(logn). A faster way is to use hash indexing O(1), but performs not as good when the request is a range of lines. 
I used standard implementation with indexing, so it should run O(logn).

### How will your system perform with 100 users? 10000 users? 1000000 users?
Unicorn fork multi process with 2-4 workers into available server ram. With preload on, it will start up faster for copies of the process. Heroku also has options to increase number of dynos at a price to match the worker needs. In my app at the free tier, if there are too many users then the request will start queuing up, and at certain point start to time out. 
According to Amdahl’s Law from my class, “max speed up” = 1/ ( ( 1-a/P) +a) , where a is the % synchronized codes, and P is number of process. Since we have read-only, so a = 0. We get 1/ (1/P) = P. The concurrency speedup should be close to linear.

### What documentation, websites, papers, etc did you consult in doing this assignment?
concurrency with unicorn
https://devcenter.heroku.com/articles/rails-unicorn

creating indexes with mongoid
https://mongoid.github.io/en/mongoid/docs/indexing.html

creating the upload file input:
https://richonrails.com/articles/importing-csv-files

configure paid dynos  currurency:
https://medium.com/swlh/running-a-high-traffic-rails-app-on-heroku-s-performance-dynos-d9e6833d34c4#.uvgnh2iq6

### What third-party libraries or other tools does the system use? How did you choose each library or framework you used?
I used ruby on rails framework because of it's built in mvc rest api, many gems plugins, and scaffold templates. 
I used Mongodb because its scalable for files to be distributed and caching.
I used Unicorn for concurrent server process. It’s easy to setup, works both threadsafe and not.
I used Heroku platform to deploy my app, works well with rails, direct link to github

### How long did you spend on this exercise? If you had unlimited more time to spend on this, how would you spend it and how would you prioritize each item?
I spent few hours to setup the new version of rails/ruby/mongo, while researching gems and planning different implementations. To get the app onto live server and have functioning req/res took about half the day. Then debugging, research on stackoverflow / rails tutorials took another few hours. Improving the app with lib to handle concurrency and volume took a few hours. Lastly, I spent a few more hours on code reviews and final analysis report.

Total time I spent is roughly 20 hours. 

If I have unlimited time, I would first outline what functionalities I want to complete, then prioritize by getting the core function working first, then try to add custom functionality. 


###If you were to critique your code, what would you have to say about it?

Need unit tests, performance testing. Git pull request control.

Issue that can destroy the system could be ddos attacks, or code 
injections from the upload file.

add security session if the data is sensitive. 

For the frontend, it would be cool to use angular to display text as user pick the line

Dev db is hooked up to live server

Instead of destroying the prev file before loading the new one. I would schedule the delete when server has downtime.


