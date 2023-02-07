const { Pool } = require('pg');

const args = process.argv.slice(2);

console.log('1')
const pool = new Pool({
  user: 'labber',
  password: 'labber',
  host: 'localhost',
  database: 'bootcampx'
});
const query = `
SELECT students.id as student_id, students.name as name, cohorts.name as cohort
FROM students
JOIN cohorts ON cohorts.id = cohort_id
WHERE cohorts.name LIKE '%${args[0]}%'
LIMIT ${parseInt(args[1])};
`

console.log(query)

pool.query(query)
.then(res => {
  res.rows.forEach(user => {
    console.log(`${user.name} has an id of ${user.student_id} and was in the ${user.cohort} cohort`);
  })
}).catch((err) => console.log(err));

// CREATE TABLE cohorts (
//   id SERIAL PRIMARY KEY NOT NULL,
//   name VARCHAR(255) NOT NULL,
//   start_date DATE,
//   end_date DATE
// );