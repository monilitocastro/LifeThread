CREATE TABLE Account (
  AccountID INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
  TimestampRecent  TIMESTAMP,
  Delinquency INT,
  Balance DECIMAL(16, 2)
);

CREATE TABLE User (
  UserID INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
  UserType ENUM('Patient', 'Nurse', 'Nurse Practitioner', 'Physician', 'Admin', 'EMT', 'Specialist', 'Technician'),
  Name VARCHAR(255),
  Username VARCHAR(255),
  Password VARCHAR(255),
  Address VARCHAR(255),
  AccountID INT,
  FOREIGN KEY (AccountID) REFERENCES Account(AccountID)
);

CREATE TABLE MedicalRecord (
  MR_ID INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
  EmplID INT,
  PatientID INT,
  SymptID INT,
  Trtmt_ID INT,
  Folder_path VARCHAR(255),
  Timestamp TIMESTAMP,
  DescriptionID INT,
  RxNumber INT,
  FOREIGN KEY (RxNumber) REFERENCES Prescription(RxNumber),
  FOREIGN KEY (DescriptionID) REFERENCES Description(DescriptionID),
  FOREIGN KEY (Trtmt_ID) REFERENCES Treatment(TreatmentID),
  FOREIGN KEY (SymptID) REFERENCES Symptom(SymptomID),
  FOREIGN KEY (PatientID) REFERENCES User(UserID),
  FOREIGN KEY (EmplID) REFERENCES User(UserID)
); 

CREATE TABLE Transactions (
  TransactionID INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
  PatientID INT,
  Timestamp TIMESTAMP,
  TransactionType BOOLEAN,
  Amount DECIMAL(16, 2),
  FOREIGN KEY (PatientID) REFERENCES User(UserID)
);

CREATE TABLE Appointment (
  AppointmentID INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
  PhysicianID INT,
  PatientID INT,
  Time DATETIME,
  DescriptionID INT,
  FOREIGN KEY (DescriptionID) REFERENCES Description(DescriptionID),
  FOREIGN KEY (PhysicianID) REFERENCES User(UserID),
  FOREIGN KEY (PatientID) REFERENCES User(UserID)
);

CREATE TABLE Symptom (
  SymptomID INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
  Name VARCHAR(255)
);

CREATE TABLE Treatment (
  TreatmentID INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
  Name VARCHAR(255),
  Cost DECIMAL(16, 2)
);

CREATE TABLE Prescription (
  RxNumber INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
  Name VARCHAR(255),
  Quantity INT,
  Refills INT
);

CREATE TABLE Description (
  DescriptionID INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
  FreeFormText TEXT
);


