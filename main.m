% Use the StudentDatabase object
db = StudentDatabase();

% Adding students
db = db.addStudent(Student('1', 'Adam', 19, 3.4, 'Computer Science'));
db = db.addStudent(Student('2', 'Nick', 18, 3.8, 'Engineering'));
db = db.addStudent(Student('3', 'Matt', 18, 4.0, 'Engineering'));
db = db.addStudent(Student('4', 'CJ', 20, 3.0, 'Teaching'));

% Save the database
db.saveToFile('studentDatabase.mat');

% Load the database
db = db.loadFromFile('studentDatabase.mat');

% Find student by an ID
student = db.findStudentByID('3');
if ~isempty(student)
    student.displayInfo();
else
    disp('Student not found.');
end

% Get students by major
studentsInCS = db.getStudentsByMajor('Computer Science');
disp('Students in Computer Science:');
for i = 1:length(studentsInCS)
    studentsInCS(i).displayInfo();
end

% Generate visualizations
figure;
db.plotGPADistribution();

figure;
db.plotAverageGPAByMajor();

figure;
db.plotAgeDistribution();