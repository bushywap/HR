package com.example.employee.repository;

import com.example.employee.model.ShiftAssignment;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import java.time.LocalDate;
import java.util.List;
import java.util.Optional;

public interface ShiftAssignmentRepository extends JpaRepository<ShiftAssignment, Long> {
    List<ShiftAssignment> findByWorkDateBetween(LocalDate from, LocalDate to);

    @Query("""
        SELECT a FROM ShiftAssignment a
        JOIN FETCH a.shift
        JOIN FETCH a.employee
        WHERE a.workDate BETWEEN :from AND :to
        """)
    List<ShiftAssignment> findByWorkDateBetweenWithDetails(
        @Param("from") LocalDate from,
        @Param("to") LocalDate to
    );
    Optional<ShiftAssignment> findByEmployee_IdAndWorkDate(String employeeId, LocalDate workDate);
}

