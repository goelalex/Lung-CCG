library Infoway

using FHIR version '4.0.0'

include FHIRHelpers version '4.0.0'

valueset "Low Dose Chest CT Codes": 'http://infoway.org/fhir/ValueSet/low-dose-chest-ct-codes'

context Patient

define "Low Dose Chest CT":
  ["Observation": "Low Dose Chest CT Codes"]

define "First Low Dose Chest CT":
  First("Low Dose Chest CT" C sort by issued)

define "Low Dose Chest CT Within 5 Years":
  "Low Dose Chest CT" C
    where C.issued 5 years or less after "First Low Dose Chest CT".issued

define "Current Low Dose Chest CT Order":
  ["ServiceRequest": "Low Dose Chest CT Codes"] SR
    where SR.intent = 'order'

define "Needs Low Dose Chest CT":
  not exists ("Low Dose Chest CT Within 5 Years")
    and not exists ("Current Low Dose Chest CT Order")
