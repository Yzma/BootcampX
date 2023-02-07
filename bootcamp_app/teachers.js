const { Pool } = require('pg');

const args = process.argv.slice(2);

const pool = new Pool({
  user: 'labber',
  password: 'labber',
  host: 'localhost',
  database: 'bootcampx'
});

console.log('args ', args)
const query = `
SELECT DISTINCT teachers.name, cohorts.name AS cohort_name
FROM assistance_requests
JOIN teachers ON teachers.id = assistance_requests.teacher_id
JOIN students ON students.id = assistance_requests.student_id
JOIN cohorts ON cohorts.id = students.cohort_id
WHERE cohorts.name = '${args[0]}'
GROUP BY cohorts.name, teachers.name
ORDER BY teachers.name;
`

pool.query(query)
.then(res => {
  res.rows.forEach(user => {
    console.log(`${user.cohort_name}: ${user.name}`);
  })
}).catch((err) => console.log(err));
