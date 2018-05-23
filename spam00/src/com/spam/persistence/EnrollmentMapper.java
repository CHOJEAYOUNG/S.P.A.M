package com.spam.persistence;

import java.util.List;

import com.spam.domain.Enrollment;

public interface EnrollmentMapper {
	public List<Enrollment> select();
}
