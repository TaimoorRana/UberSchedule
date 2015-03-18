
class FileReader
  require 'csv'

  newCourseFilter = "background-color:LightBlue;"
  courseAndTermFilter = "<td align=\"left\" colspan=\"1\" style=\"font-size:10pt;font-weight:bold;white-space:nowrap;\">"
  courseNameFilter = "<td align=\"left\" colspan=\"3\" style=\"font-size:10pt;font-weight:normal;\"><b>"

  expectCourse = 0
  expectSection = 0

  courseType = ""
  courseNumber = 0
  courseName = ""
  courseTerm = ""
  courseSection = ""
  courseDay = ""
  courseTime = ""
  courseCampus = ""

  cvs_builder = ""
  testCounter = 0

  File.open('comp.txt', 'r').each do |line|
    #----------------------------------------------------------------------------
    # COURSE TYPE, COURSE NUMBER, COURSE NAME
    # CREDITS WOULD BE HERE
    #----------------------------------------------------------------------------
    if line.include? newCourseFilter
      expectCourse = 1
    else if expectCourse == 1 and line.include? courseAndTermFilter
           expectCourse = 0
           expectTerm = 1
           comp_match = line.scan(/(COMP\s[0-9]{3})/)
           soen_match = line.scan(/(SOEN\s[0-9]{3})/)
           engr_match = line.scan(/(ENGR\s[0-9]{3})/)
           if comp_match[0] != nil
             courseType = "COMP"
             courseNumber = comp_match[0].to_s.sub("[\"COMP ","").sub("\"]","")
           end
           if soen_match[0] != nil
             courseType = "SOEN"
             courseNumber = soen_match[0].to_s.sub("[\"SOEN ","").sub("\"]","")
           end
           if engr_match[0] != nil
             courseType = "ENGR"
             courseNumber = engr_match[0].to_s.sub("[\"ENGR ","").sub("\"]","")
           end
           courseName = line.scan(/<b>[^<]*/)
           courseName = courseName[0].sub("<b>","")
           cvs_builder = courseType + " " + courseNumber + " " + courseName
           expectCourse = 0
         end
    end
    #----------------------------------------------------------------------------
    # COURSE TERM
    #----------------------------------------------------------------------------
    if line.include? "Summer"
      courseTerm = "Summer"
      if line.include? "Term: Term: 07 July      - 19 August"
        courseTerm = "Summer 2"
      end
      if line.include? "Term: 07 May       - 23 June"
        courseTerm = "Summer 1"
      end
    end
    if line.include? "Winter"
      courseTerm = "Winter"
    end
    if line.include? "Winter"
      courseTerm = "Fall"
    end

    #----------------------------------------------------------------------------
    # COURSE LECTURE, DAY, HOURS, LOCATION, PROF
    #----------------------------------------------------------------------------
    if (line.include? "/1") or (line.include? "/2") or (line.include? "/4")
      courseSection = line.scan(/<b>[^<]*/)
      courseSection = courseSection[0].to_s.sub("<b>","")
      if (courseSection.include? "Lect") == false and (courseSection.include? "Ugrad") == false and (courseSection.include? "OnLine") == false
        courseLabTutSection = line.scan(/<b>.{13}/).to_s
        courseLabTutSection = courseLabTutSection[16,2].to_s
        courseSection = courseSection + " " + courseLabTutSection
      end

      timeAndDate = (line.scan(/.{7}\s\(.{11}\)/)).to_s

      if timeAndDate.include? "M"
        courseDay = courseDay + "Monday"
      end
      if timeAndDate.include? "T"
        courseDay = courseDay + "Tuesday"
      end
      if timeAndDate.include? "W"
        courseDay = courseDay + "Wednesday"
      end
      if timeAndDate.include? "J"
        courseDay = courseDay + "Thursday"
      end
      if timeAndDate.include? "F"
        courseDay = courseDay + "Friday"
      end

      courseStartTime = timeAndDate[11,5]
      courseEndTime = timeAndDate[17,5]

      courseCampus = (line.include? "SGW") ? "SGW" : "Loyola"

      arr = Array.new
      arr.push(courseType)
      arr.push(courseNumber)
      arr.push(courseName)
      arr.push(courseTerm)
      arr.push(courseSection)
      arr.push(courseDay)
      arr.push(courseStartTime)
      arr.push(courseStartTime)

      CSV.open("courseInfo.csv", "a") do |csv|
        csv << arr
      end

      #print arr
      #puts ""
      courseDay = ""


    end
  end

end