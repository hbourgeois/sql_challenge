-- DROP TABLE IF EXISTS SECTION --
DROP TABLE IF EXISTS departments CASCADE;
DROP TABLE IF EXISTS titles CASCADE;
DROP TABLE IF EXISTS employees CASCADE;
DROP TABLE IF EXISTS dept_managers CASCADE;
DROP TABLE IF EXISTS dept_employees CASCADE;
DROP TABLE  IF EXISTS salaries CASCADE;


-- CREATE TABLES --

CREATE TABLE "departments" (
	"dept_no" VARCHAR NOT NULL,
	"dept_name" VARCHAR NOT NULL,
	CONSTRAINT "pk_departments" PRIMARY KEY (
		"dept_no"
	)
);

CREATE TABLE "titles" (
    "title_id" VARCHAR   NOT NULL,
    "title" VARCHAR   NOT NULL,
    CONSTRAINT "pk_titles" PRIMARY KEY (
        "title_id"
     )
);

CREATE TABLE "employees" (
    "emp_no" int   NOT NULL,
    "emp_title" VARCHAR   NOT NULL,
    "birth_date" date   NOT NULL,
    "first_name" varchar   NOT NULL,
    "last_name" varchar   NOT NULL,
    "sex" char(1)   NOT NULL,
    "hire_date" date   NOT NULL,
    CONSTRAINT "pk_employees" PRIMARY KEY (
        "emp_no"
     )
);

CREATE TABLE "dept_managers" (
    "dept_no" VARCHAR   NOT NULL,
    "emp_no" int   NOT NULL,
	CONSTRAINT "pk_dept_managers" PRIMARY KEY (
		"dept_no", "emp_no"
	)
);

CREATE TABLE "dept_employees" (
    "emp_no" int   NOT NULL,
    "dept_no" VARCHAR   NOT NULL,
	CONSTRAINT "pk_dept_managers" PRIMARY KEY (
		"emp_no", "dept_no"
	)
);

CREATE TABLE "salaries" (
    "emp_no" int   NOT NULL,
    "salary" money   NOT NULL,
	CONSTRAINT "pk_salaries" PRIMARY KEY (
		"emp_no"
	)
);

ALTER TABLE "employees" ADD CONSTRAINT "fk_employees_emp_title" FOREIGN KEY("emp_title")
REFERENCES "titles" ("title_id");

ALTER TABLE "dept_managers" ADD CONSTRAINT "fk_dept_managers_dept_no" FOREIGN KEY("dept_no")
REFERENCES "departments" ("dept_no");

ALTER TABLE "dept_managers" ADD CONSTRAINT "fk_dept_managers_emp_no" FOREIGN KEY("emp_no")
REFERENCES "employees" ("emp_no");

ALTER TABLE "dept_employees" ADD CONSTRAINT "fk_dept_employees_emp_no" FOREIGN KEY("emp_no")
REFERENCES "employees" ("emp_no");

ALTER TABLE "dept_employees" ADD CONSTRAINT "fk_dept_employees_dept_no" FOREIGN KEY("dept_no")
REFERENCES "departments" ("dept_no");

ALTER TABLE "salaries" ADD CONSTRAINT "fk_salaries_emp_no" FOREIGN KEY("emp_no")
REFERENCES "employees" ("emp_no");