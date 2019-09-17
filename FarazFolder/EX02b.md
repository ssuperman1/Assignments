# Norm 1 Normalization Process For Veterinary Office

R1 = PetName (PetType, PetBreed, PetDOB, OwnersLastName, OwnersFirstName, OwnerPhone, OwnerEmail, Service, Date, Charge)

# Norm 2 PrimaryKey OwnerLastName
 
R12a = PetName (PetType, PetBreed, PetDOB, **OwnersLastName**, OwnersFirstName, OwnerPhone, OwnerEmail, **Service**, Date, Charge)

R12b = PetName (PetType, PetBreed, PetDOB,PetID) | 
OwnersLastNAme(OwnersFirstName, OwnerPhone, OwnerEmail,OwnerID)
Service (Date, Charge,ServiceID)

# Norm 3 IDs Created along with ID Relations

R13b = PetName (PetID, PetType, PetBreed, PetDOB)  | 
OwnersLastName(OwnerID, OwnersFirstName, OwnerPhone, OwnerEmail, PetID)   | 
Service (Service ID, Date, Charge, PetID, OwnerID)
