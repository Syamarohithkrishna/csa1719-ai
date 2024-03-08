symptom(alice, fever).
symptom(alice, cough).
symptom(bob, headache).
symptom(carol, fever).
symptom(carol, cough).

diagnosis(Patient, flu) :- symptom(Patient, fever), symptom(Patient, cough).
diagnosis(Patient, cold) :- symptom(Patient, cough).
diagnosis(Patient, migraine) :- symptom(Patient, headache).

query_diagnosis(Patient, Disease) :- diagnosis(Patient, Disease), format("~w has ~w.~n", [Patient, Disease]).
query_diagnosis(Patient, "Unknown") :- format("Cannot diagnose ~w.~n", [Patient]).
