Select Visit,
  TotalPatient AS 'Count of patient'
FROM
  (/*Getting the no of visit for all the visit type*/
    Select CASE WHEN vt.name = 'IPD' THEN 2 ELSE 0 END AS VisitDisplayOrder,
      CASE WHEN vt.name ='OPD' THEN 'General OPD' ELSE vt.name END AS Visit,
      COUNT(v.patient_id) 'TotalPatient'
    from visit v
    JOIN visit_type vt
      on v.visit_type_id=vt.visit_type_id
    where
      v.voided is FALSE
      and DATE (v.date_started)  BETWEEN '#startDate#' and '#endDate#'
    GROUP BY vt.name

    UNION ALL

/*Getting total of all the visit type except IPD*/
    Select 1 AS VisitDisplayOrder,
      'Total'AS Visit,
      COUNT(v.patient_id) 'TotalPatient'
    from visit v
      JOIN visit_type vt
        on v.visit_type_id=vt.visit_type_id
    where
      v.voided is FALSE
      and vt.name<>'IPD'
      and DATE (v.date_started)  BETWEEN '#startDate#' and '#endDate#'
    ORDER BY VisitDisplayOrder
) VisitCount;