source('domain/Address.r')

School <- setRefClass(
  'School',
  fields = c(
    id = 'numeric',
    name = 'character',
    fullName = 'character',
    isbeName = 'character',
    address = 'Address',
    ncesId = 'numeric',
    cpsUnit = 'numeric',
    isbeId = 'character',
    oracleId = 'numeric',
    class = 'character',
    schoolType = 'character',
    sType = 'character',
    schoolCategory = 'character',
    governance = 'character',
    charterType = 'character',
    gradeStructure = 'character',
    attendingGrades = 'character',
    programTypes = 'character'
  )
)
