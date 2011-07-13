# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Mayor.create(:name => 'Daley', :city => cities.first)
Result.delete_all

Result.create(
:title =>'test',
:url => 'www.nemecisco.com', 
:parentRequest => 2, 
:head => '<HEAD>goes here
',

:body =>'
<BODY goes here>,',
    
:respCode => '200', 

:links => 'www.nemecisco.com/gpage1.html , www.nemecisco.com/products ,www.nemecisco.com/contact' ,

:description => 'Blank',
:comment => 'Blank'
)

