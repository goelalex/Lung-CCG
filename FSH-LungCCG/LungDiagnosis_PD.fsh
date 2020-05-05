Profile:        CPG PlanDefinition
//Shareable PlanDefinition is the parent - is this the correct way or do we need to specify the base resource? Do we need a local copy of a FSH instance of Shareable PlanDefintion Profile for SUSHI?
Parent:         http://hl7.org/fhir/R4/shareableplandefinition.html 
Id:             cpg-plandefinition
Title:          "CPG PlanDefinition"
Description:    "Test of CPG Profile in FSH"
// starting with CPG profile first then working down to Lung specific example 
// do I need to copy in the values from Shareable PlanDefinition? http://hl7.org/fhir/R4/shareableplandefinition.html 
* identifier 1..*
* title 1..1 
* type 1..1
* date 1..1
* relatedArtifact.display 1..1
* relatedArtifact.url 1..1
* library 0..1
// how to set library as only reference type? Is Canonical the same as a reference? Canoncial should be the source of truth for all servers. Will this default to canonical? 
// supposed to be CQL Library resource in FHIR - is this correct? Is there a sub-profile of Library that this is based off of? May need Bryn for this question
* library only {Reference} (Library)
* action 1..*
//CQF profile-Strength of recommendation profile for documentation element for @Chris or Bryn
* documentation.^{http://hl7.org/fhir/StructureDefinition/cqf-strengthOfRecommendation}
// how do define CPG common Persona as an extensible binding for participant role? Syntax = (extensible) where do we put the URL? http://hl7.org/fhir/uv/cpg/CodeSystem/cpg-common-persona 
* participant.role 0..1
* participant from CPG Common Persona (extensible)
* definition 