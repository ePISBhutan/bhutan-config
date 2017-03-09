select 
patient_identifier.identifier as Identifier, 
concat(pname.given_name,' ',pname.family_name) as 'Patient Name',
sum(datediff(bedpatmap.date_stopped,bedpatmap.date_started)) as 'Length of stay in days' ,
person_address.city_village as City,
person.gender as Sex ,
floor(datediff(now(),person.birthdate)/365) as 'Age',
ifnull(NBStatus.name,'B') as 'Nationality',
bedpatmap.date_started as 'Date of Admission', 
bedpatmap.date_stopped as 'Date of Discharge'
from 
bed_patient_assignment_map bedpatmap
inner join person_name pname
	on bedpatmap.patient_id = pname.person_id
inner join person
	on pname.person_id = person.person_id
inner join patient_identifier
	on pname.person_id = patient_identifier.patient_id
left Join
	(
		Select person_attribute.person_id,cn.name
		from person_attribute
		inner join person_attribute_type
		on person_attribute_type.person_attribute_type_id=person_attribute.person_attribute_type_id
		and person_attribute.person_attribute_type_id=(select person_attribute_type_id from person_attribute_type where name='NonResidentialBhutaneseType')
		inner join concept_name cn
		on cn.concept_id=person_attribute.value
	) as NBStatus
on NBStatus.person_id=person.person_id
left join person_address
	on person.person_id = person_address.person_id
group by person.person_id;