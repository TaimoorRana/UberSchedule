# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


#Creating Core SOEN Course Relation with Sequence
# s = Sequence.find_by sequence_name: 'Software Engineering Core'
# a = Course.find_by dept: 'SOEN', number: 228
# s.courses.append(a)
# puts a
# a = Course.find_by dept: 'SOEN', number: 287
# s.courses.append(a)
# puts a
# a = Course.find_by dept: 'SOEN', number: 321
# s.courses.append(a)
# puts a
# a = Course.find_by dept: 'SOEN', number: 331
# s.courses.append(a)
# puts a
# a = Course.find_by dept: 'SOEN', number: 341
# s.courses.append(a)
# puts a
# a = Course.find_by dept: 'SOEN', number: 342
# s.courses.append(a)
# puts a
# a = Course.find_by dept: 'SOEN', number: 343
# s.courses.append(a)
# puts a
# a = Course.find_by dept: 'SOEN', number: 344
# s.courses.append(a)
# puts a
# a = Course.find_by dept: 'SOEN', number: 345
# s.courses.append(a)
# puts a
# a = Course.find_by dept: 'SOEN', number: 357
# s.courses.append(a)
# puts a
# a = Course.find_by dept: 'SOEN', number: 384
# s.courses.append(a)
# puts a
# a = Course.find_by dept: 'SOEN', number: 385
# s.courses.append(a)
# puts a
# a = Course.find_by dept: 'SOEN', number: 390
# s.courses.append(a)
# puts a
# a = Course.find_by dept: 'SOEN', number: 490
# s.courses.append(a)
# puts a
# a = Course.find_by dept: 'COMP', number: 232
# s.courses.append(a)
# puts a
# a = Course.find_by dept: 'COMP', number: 248
# s.courses.append(a)
# puts a
# a = Course.find_by dept: 'COMP', number: 249
# s.courses.append(a)
# puts a
# a = Course.find_by dept: 'COMP', number: 335
# s.courses.append(a)
# puts a
# a = Course.find_by dept: 'COMP', number: 346
# s.courses.append(a)
# puts a
# a = Course.find_by dept: 'COMP', number: 348
# s.courses.append(a)
# puts a
# a = Course.find_by dept: 'COMP', number: 352
# s.courses.append(a)
# puts a
#
# #Creating Computer games specialization sequence-course associations
# s = Sequence.find_by sequence_name: 'Computer Games'
#
# a = Course.find_by dept: 'COMP', number: 345
# s.courses.append(a)
# a = Course.find_by dept: 'COMP', number: 371
# s.courses.append(a)
# a = Course.find_by dept: 'COMP', number: 376
# s.courses.append(a)
# a = Course.find_by dept: 'COMP', number: 472
# s.courses.append(a)
# a = Course.find_by dept: 'COMP', number: 476
# s.courses.append(a)
# a = Course.find_by dept: 'COMP', number: 477
# s.courses.append(a)

#Creating Web services specialization sequence-course associations
# s = Sequence.find_by sequence_name: 'Web Services and Applications'
#
# a = Course.find_by dept: 'COMP', number: 353
# s.courses.append(a)
# a = Course.find_by dept: 'COMP', number: 445
# s.courses.append(a)
# a = Course.find_by dept: 'COMP', number: 479
# s.courses.append(a)
# a = Course.find_by dept: 'SOEN', number: 387
# s.courses.append(a)
# a = Course.find_by dept: 'SOEN', number: 487
# s.courses.append(a)

#Creating Real‑Time Embedded and Avionics Software sequence-course associations
s = Sequence.find_by sequence_name: 'RealTime Embedded and Avionics Software'

 a = Course.find_by dept: 'AERO', number: 480
s.courses.append(a)
puts a.dept + a.number.to_s
a = Course.find_by dept: 'AERO', number: 482
s.courses.append(a)
puts a.dept + a.number.to_s
### COEN 320 NOT ADDED YET ############################################
# a = Course.find_by dept: 'COEN', number: 320
# s.courses.append(a)
a = Course.find_by dept: 'COMP', number: 345
s.courses.append(a)
puts a.dept + a.number.to_s
a = Course.find_by dept: 'COMP', number: 444
s.courses.append(a)
puts a.dept + a.number.to_s
a = Course.find_by dept: 'SOEN', number: 422
s.courses.append(a)
puts a.dept + a.number.to_s
a = Course.find_by dept: 'SOEN', number: 423
s.courses.append(a)
puts a.dept + a.number.to_s

#Creating General sequence-course association
s = Sequence.find_by sequence_name: 'General'

# a = Course.find_by dept: 'AERO', number: 480
# s.courses.append(a)
# puts a.dept + a.number.to_s
# a = Course.find_by dept: 'AERO', number: 482
# s.courses.append(a)
# puts a.dept + a.number.to_s
##COURSE NOT YET ENTERED #########################################
# a = Course.find_by dept: 'COEN', number: 320
# s.courses.append(a)
# puts a.dept + a.number.to_s
a = Course.find_by dept: 'COMP', number: 345
s.courses.append(a)
puts a.dept + a.number.to_s
a = Course.find_by dept: 'COMP', number: 353
s.courses.append(a)
puts a.dept + a.number.to_s
a = Course.find_by dept: 'COMP', number: 371
s.courses.append(a)
puts a.dept + a.number.to_s
a = Course.find_by dept: 'COMP', number: 376
s.courses.append(a)
puts a.dept + a.number.to_s
a = Course.find_by dept: 'COMP', number: 426
s.courses.append(a)
## COURSES  NOT YET ENTERED ################################
# puts a.dept + a.number.to_s
# a = Course.find_by dept: 'COMP', number: 428
# s.courses.append(a)
# puts a.dept + a.number.to_s
# a = Course.find_by dept: 'COMP', number: 442
# nas.courses.append(a)
# puts a.dept + a.number.to_s
a = Course.find_by dept: 'COMP', number: 444
s.courses.append(a)
puts a.dept + a.number.to_s
a = Course.find_by dept: 'COMP', number: 445
s.courses.append(a)
puts a.dept + a.number.to_s
a = Course.find_by dept: 'COMP', number: 451
s.courses.append(a)
puts a.dept + a.number.to_s
a = Course.find_by dept: 'COMP', number: 465
s.courses.append(a)
puts a.dept + a.number.to_s
a = Course.find_by dept: 'COMP', number: 472
s.courses.append(a)
puts a.dept + a.number.to_s
a = Course.find_by dept: 'COMP', number: 473
s.courses.append(a)
puts a.dept + a.number.to_s
a = Course.find_by dept: 'COMP', number: 474
s.courses.append(a)
puts a.dept + a.number.to_s
a = Course.find_by dept: 'COMP', number: 476
s.courses.append(a)
puts a.dept + a.number.to_s
a = Course.find_by dept: 'COMP', number: 477
s.courses.append(a)
puts a.dept + a.number.to_s
a = Course.find_by dept: 'COMP', number: 478
s.courses.append(a)
puts a.dept + a.number.to_s
a = Course.find_by dept: 'COMP', number: 479
s.courses.append(a)
puts a.dept + a.number.to_s
## COURSES  NOT YET ENTERED ################################
# a = Course.find_by dept: 'ENGR', number: 411
# s.courses.append(a)
# puts a.dept + a.number.to_s
# a = Course.find_by dept: 'SOEN', number: 298
# s.courses.append(a)
# puts a.dept + a.number.to_s
a = Course.find_by dept: 'SOEN', number: 387
s.courses.append(a)
puts a.dept + a.number.to_s
a = Course.find_by dept: 'SOEN', number: 422
s.courses.append(a)
puts a.dept + a.number.to_s
a = Course.find_by dept: 'SOEN', number: 423
s.courses.append(a)
puts a.dept + a.number.to_s
a = Course.find_by dept: 'SOEN', number: 448
s.courses.append(a)
puts a.dept + a.number.to_s
a = Course.find_by dept: 'SOEN', number: 487
s.courses.append(a)
puts a.dept + a.number.to_s
a = Course.find_by dept: 'SOEN', number: 491
s.courses.append(a)
puts a.dept + a.number.to_s
