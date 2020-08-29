package edu.college.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import edu.college.dao.StudentDao;
import edu.college.models.Student;

@Controller
public class StudentController {
	
	@Autowired
	StudentDao dao;
	
	ArrayList<String> departmentList = new ArrayList<String>() {
		{
			add("CSE");
			add("ECE");
			add("IT");
			add("EEE");
			add("EE");
			add("CE");
			add("ME");
		}
	};
	
	ArrayList<String> semesterList = new ArrayList<String>() {
		{
			add("I");
			add("II");
			add("III");
			add("IV");
			add("V");
			add("VI");
			add("VII");
			add("VIII");
		}
	};
	
	ArrayList<Character> sectionList = new ArrayList<Character>() {
		{
			add('A');
			add('B');
			add('C');
		}
	};
	
	ArrayList<String> genderList = new ArrayList<String>() {
		{
			add("Male");
			add("Female");
		}
	};
	
	@RequestMapping(value="addStudentForm")
	public ModelAndView preAddStudent() {
		Student student = new Student();
		ModelAndView mv = new ModelAndView("add-student", "student", student);
		mv.addObject("departmentList", departmentList);
		mv.addObject("semesterList", semesterList);
		mv.addObject("sectionList", sectionList);
		mv.addObject("genderList", genderList);
		return mv;
	}
	
	@RequestMapping(value="/addStudent", method=RequestMethod.POST)
	public void addStudent(@ModelAttribute("student") Student student, HttpServletRequest request, HttpServletResponse response) {
		System.out.println("Section: " + student.getSection());
		String message;
		String messageColor;
		
		if (dao.addStudent(student)) {
			message = "Student added successfully, generated roll no. is: " + student.getRollNo();
			messageColor = "green";
		} else {
			message = "Failed to add student";
			messageColor = "red";
		}
		
		request.setAttribute("message", message);
		request.setAttribute("messageColor", messageColor);
		
		try {
			request.getRequestDispatcher("index.jsp").forward(request, response);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	@RequestMapping(value="/deleteStudentForm")
	public String preDeleteStudent() {
		return "delete-student";
	}
	
	@RequestMapping(value="/getStudentByRollNoForDelete")
	public ModelAndView getStudentByRollNoForDelete(@RequestParam("rollNo") int rollNo, HttpServletRequest request) {
		
		ModelAndView mv = new ModelAndView("delete-student");
		Student student = dao.getStudentByRollNo(rollNo);
		
		if (student == null) {
			mv.addObject("message", "No student with roll number \"" + rollNo + "\" exists");
		} else {
			request.getSession().setAttribute("student", student);
		}
		
		return mv;
	}
	
	@RequestMapping(value="/deleteStudent", method=RequestMethod.POST)
	public void deleteStudent(HttpServletRequest request, HttpServletResponse response) {
		
		HttpSession session = request.getSession();
		Student student = (Student) session.getAttribute("student");
		String message = null;
		String messageColor = null;
		
		if (dao.deleteStudent(student)) {
			message = "Deleted Student with roll number: " + student.getRollNo();
			messageColor = "green";
		} else {
			message = "Failed to deleted student with roll number: " + student.getRollNo();
			messageColor = "red";
		}
		
		session.removeAttribute("student");
		request.setAttribute("message", message);
		request.setAttribute("messageColor", messageColor);
		try {
			request.getRequestDispatcher("index.jsp").forward(request, response);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	@RequestMapping(value="/modifyStudentForm")
	public String preModifyStudent() {
		return "modify-student";
	}
	
	@RequestMapping(value="/getStudentByRollNoForModify")
	public ModelAndView getStudentByRollNoForModify(@RequestParam("rollNo") int rollNo) {
		
		ModelAndView mv = new ModelAndView("modify-student");
		Student student = dao.getStudentByRollNo(rollNo);
		
		if (student == null) {
			mv.addObject("message", "No student with roll number \"" + rollNo + "\" exists");
		} else {
			mv.addObject("student", student);
			mv.addObject("departmentList", departmentList);
			mv.addObject("semesterList", semesterList);
			mv.addObject("sectionList", sectionList);
			mv.addObject("genderList", genderList);
		}
		
		return mv;
	}
	
	@RequestMapping(value="/modifyStudent")
	public void modifyStudent(@ModelAttribute("student") Student student, HttpServletRequest request, HttpServletResponse response) {
		String message = null;
		String messageColor = null;
		
		if (dao.modifyStudent(student)) {
			message = "Successfully modified the details of student with roll number: " + student.getRollNo();
			messageColor = "green";
		} else {
			message = "Failed to modify the details of student with roll number: " + student.getRollNo();
			messageColor = "red";
		}
		
		request.setAttribute("message", message);
		request.setAttribute("messageColor", messageColor);
		try {
			request.getRequestDispatcher("index.jsp").forward(request, response);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	@RequestMapping(value="/selectStudentForm")
	public String selectStudentForm() {
		return "select-student";
	}

	@RequestMapping(value="/getStudentByRollNoForSelect")
	public ModelAndView getStudentByRollNoForSelect(@RequestParam("rollNo") int rollNo) {
		
		ModelAndView mv = new ModelAndView("select-student");
		
		Student student = dao.getStudentByRollNo(rollNo);
		if (student == null) {
			mv.addObject("message", "No student with roll number \"" + rollNo + "\" exists");
		} else {
			mv.addObject("student", student);
		}
		return mv;
	}
	
	
	@RequestMapping(value="/selectAllStudent")
	public ModelAndView getAllStudent() {
		ModelAndView mv = new ModelAndView("select-all-student");
		List<Student> studentList = dao.getAllStudent();
		if (studentList != null) {
			mv.addObject("studentList", studentList);
		} else {
			mv.addObject("message", "No students to display");
		}
		return mv;
	}
	
}
