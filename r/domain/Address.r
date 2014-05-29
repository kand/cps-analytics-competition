if(!exists('DomainObject', mode = 'function')) source('domain/DomainObject.r')

Address <- setRefClass(
  
  'Address',
  
  contains = c(
    'DomainObject'
  ),
  
  fields = c(
    number = 'numeric',
    directrion = 'character',
    street = 'character',
    city = 'character',
    state = 'character',
    zip = 'character',
    ward = 'numeric',
    communityAreaNumber = 'numeric',
    communityArea = 'character',
    cookCountyDistrict = 'numeric',
    ilSenateDistrict = 'numeric',
    ilRepDistrict = 'numeric',
    usCongressDistrict = 'numeric',
    geoAreaNumber = 'numeric',
    geoArea = 'character',
    censusBlock = 'numeric',
    lat = 'numeric',
    lng = 'numeric'
  )
  
)
