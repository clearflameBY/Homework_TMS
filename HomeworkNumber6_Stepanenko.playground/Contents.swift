typealias Student = (name: String, age: Int, grades: [String: Double], elective: Set<String>)

var students: [Student] = []

@MainActor
func addNewStudent(name: String, age: Int, grades: [String: Double], elective: Set<String>) {
    let newStudent = (name: name, age: age, grades: grades, elective: elective)
students.append(newStudent)
}

addNewStudent(name: "Anna", age: 28, grades: ["Math": 8, "English": 4, "Biology": 7, "PE": 9], elective: ["English", "Math", "PE"])
addNewStudent(name: "GLeb", age: 23, grades: ["Math": 8, "English": 9, "Biology": 6, "PE": 9], elective: ["Math", "English","Chemistry"])
addNewStudent(name: "Alex", age: 27, grades: ["Math": 5, "English": 5, "Biology": 6, "PE": 8], elective: ["English", "Math"])
addNewStudent(name: "Kate", age: 21, grades: [:], elective: ["Math", "English"])
addNewStudent(name: "Michael", age: 28, grades: ["Math": 2, "English": 2, "Biology": 8, "PE": 9], elective: ["English", "Math", "Biology"])

func calculateAverageGrade(student: Student) -> Double? {
    let grades = student.2
    if grades.isEmpty {
        return nil
    } else {
        var totalGrades = 0.0
        for value in grades.values {
            totalGrades += value
        }
        return totalGrades / Double(grades.count)
    }
}

func findStudentsByAge(students: [Student], age: Int) -> [Student] {
    return students.filter { $0.age == age }
}

func getTopStudents(students: [Student], top: Int) -> [(name: String, averageGrade: Double)] {
    return students
        .compactMap { student -> (name: String, averageGrade: Double)? in
            if let average = calculateAverageGrade(student: student) {
                return (student.name, average)
            }
            return nil
        }
        .sorted { $0.averageGrade > $1.averageGrade }
        .prefix(top)
        .map { ($0.name, $0.averageGrade) }
}

func getUniqueOptionalSubjects(students: [Student]) -> Set<String> {
    return students.flatMap { $0.elective }
                                        .reduce(into: Set<String>()) { $0.insert($1) }
}

var messageAboutAverageGrade = ""
students.forEach { element in
    if let averageValue = calculateAverageGrade(student: element) {
        messageAboutAverageGrade = String(averageValue)
    } else {
        messageAboutAverageGrade = "There is no average grade because there are no grade"
    }
    print("Name: \(element.name). Age: \(element.age). Average grade: \(messageAboutAverageGrade). Electives attended: \(element.elective)")
}
print("")
print(findStudentsByAge(students: students, age: 28))
print("")
print(getTopStudents(students: students, top: 3))
print("")
print(getUniqueOptionalSubjects(students: students))

func getStudentWithMostElectives(students: [Student]) -> [Student] {
    guard let maxCount = students
                                .map({$0.elective.count})
                                .max()
    else {
        return []
    }
    return students.filter { $0.elective.count == maxCount }
}
print("")
print (getStudentWithMostElectives(students: students))
