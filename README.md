# ClinicManagementSystem
A MySQL project about managing the appointments of a clinic complying the specific room amount, doctors of certain specialization and vacant times.

###Tables
  *Doctor (contains information such as name,practicing from date, contact no, id)
  *Specialization (contains information such as id, specialization name)
  *Doc_specialization (contains information such as doc_id, specialization_id)
  *Qualification (contains information such as Doc_id, degree name, institute name)
  *Availability (contains f=information such as room_no, doc_id, specialization_id, is        available or not, date os the allocated doctor, start and end time)
  *Patient (contains information such as id, name, address, contact_no, symptoms)
  *Department (contains information such as is,name)
  *Patient_dept (contains information such as patient_id, dept_id)
  *Appointment (contains information such as id, doc_id, patient_id, dept_id, room_no,        appointment_date, start and end time, fee amount

###Method
  The users can- 
  *Access the information of the doctor, his/her specialization, details about his            specialization and hsitory
  *Apply for an appointment according to the specialization or the doctor and appointment   is set according to the vacancy of the dorctors and the rooms according to the avacnt     slots
  *The admin can edit information
