package edu.college.dao;

import java.util.List;

import javax.transaction.Transactional;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate5.HibernateTemplate;
import org.springframework.stereotype.Repository;

import edu.college.models.Student;

@Repository
@Transactional
public class StudentDao {
	
	@Autowired
	SessionFactory sessionFactory;
	
	@Autowired
	HibernateTemplate hibernateTemplate;
	
	public boolean addStudent(Student student) {
		try {
			hibernateTemplate.persist(student);
			return true;
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
	}
	
	public Student getStudentByRollNo(int rollNo) {
		Student student = null;
		try {
			student = hibernateTemplate.get(Student.class, rollNo);
			return student;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}
	
	public boolean deleteStudent(Student student) {
		try {
			hibernateTemplate.delete(student);
			return true;
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
	}
	
	public boolean modifyStudent(Student student) {
		
		try {
			hibernateTemplate.update(student);
			return true;
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
	}
	
	public List<Student> getAllStudent() {
		Session session = sessionFactory.openSession();
		Query<Student> query = session.createQuery("from Student");
		List<Student> studentList = query.list();
		return studentList;
	}

}
