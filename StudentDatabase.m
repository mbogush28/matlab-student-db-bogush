classdef StudentDatabase
    properties
        Students 
    end
    methods
        % Save database to .mat file
        function saveToFile(obj, filename)
            Students = obj.Students;  
            save(filename, 'Students');
        end
        
        % Load database from .mat file
        function obj = loadFromFile(obj, filename)
            data = load(filename, 'Students');
            obj.Students = data.Students;
        end

        % Constructor
        function obj = StudentDatabase()
            obj.Students = [];
        end
        
        % Add a new student
        function obj = addStudent(obj, student)
            obj.Students = [obj.Students; student];
        end
        
        % Find a student by ID
        function student = findStudentByID(obj, ID)
            student = [];
            for i = 1:length(obj.Students)
                if strcmp(obj.Students(i).ID, ID)
                    student = obj.Students(i);
                    break;
                end
            end
        end
        
        % Get list of students by major
        function studentsByMajor = getStudentsByMajor(obj, major)
            studentsByMajor = [];
            for i = 1:length(obj.Students)
                if strcmp(obj.Students(i).Major, major)
                    studentsByMajor = [studentsByMajor; obj.Students(i)];
                end
            end
        end
        
        % GPA Distribution Histogram
        function plotGPADistribution(obj)
            gpas = [obj.Students.GPA];
            histogram(gpas);
            title('GPA Distribution');
            xlabel('GPA');
            ylabel('Number of Students');
        end
 
        % Average GPA by Major
        function plotAverageGPAByMajor(obj)
            majors = unique({obj.Students.Major});
            avgGPA = zeros(1, length(majors));
        
            for i = 1:length(majors)
                majorGPAs = [obj.getStudentsByMajor(majors{i}).GPA];
                avgGPA(i) = mean(majorGPAs);
            end
        
            bar(categorical(majors), avgGPA);
            title('Average GPA by Major');
            xlabel('Major');
            ylabel('Average GPA');
        end
    
        % Age Distribution
        function plotAgeDistribution(obj)
            ages = [obj.Students.Age];
            histogram(ages);
            title('Age Distribution');
            xlabel('Age');
            ylabel('Number of Students');
        end
    end
end