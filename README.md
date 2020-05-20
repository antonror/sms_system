# README

###### Installation
    1. Ruby 2.7.1
    2. Rails 6.0.3
    3. SQLite3 as database
    
If you have met the dependencies described above, please run Rails default
initialization sequence:

`rails db:create && rails db:migrate && rails db:seed`
    
###### Usage

1. Run `rails console`
2. Call `NotificationSender.call(User.first)`
3. Call `NotificationSender.call(User.last)`
4. For coverage run `rspec`

##### Conclusion

This is a sample Rails application to satisfy the minimum requirements of
the test assessment. 

It was build with TDD approach, has custom validators, service objects, system
and unit tests.