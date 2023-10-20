//import mysql from 'mysql2';
if(process.env.NODE_ENV !== 'production') {
  require('dotenv').config()
}

const fs = require('fs')
const mysql = require('mysql2')

const pool = mysql.createPool({
  host: process.env.DATABASE_HOST,
  port: process.env.DATABASE_PORT,
  user: process.env.DATABASE_USER,
  password: process.env.DATABASE_PASSWORD,
  database: process.env.DATABASE_NAME,
  ssl: {
    ca: fs.readFileSync(__dirname + '/certs/global-bundle.pem')
  }
}).promise()

async function testConnection() {
  try {
      const connection = await pool.getConnection();
      console.log("Successfully connected to the database.");
      connection.release(); // Always release the connection after usage
  } catch (error) {
      console.error("Error connecting to the database:", error);
  }
}

testConnection();

async function fetchMusicians() {
  try {
    const [results] = await pool.query("SELECT * FROM musicians");
    return results;
  } catch (err) {
    console.error("Error fetching musicians:", err);
  }
}

async function fetchMusician(mid) {
  try {
    const [results] = await pool.query(`SELECT * 
    FROM musicians 
    WHERE mid= ? `, [mid])
    return results[0];
  } catch (err){
    console.error("Error fetching musicians by id:", mid)
  }
}

async function createMusician(name) {
  const [result] =await pool.query(`
    INSERT INTO musicians (name)
    VALUES (?)
    `, [name]
  )
  const mid = result.insertId
  return fetchMusicians(mid);
}

async function fetchCategoriesByMusicianId(mid) {
  try {
    const [results] = await pool.query(`
      SELECT c.cid, c.name 
      FROM categories c
      INNER JOIN musician_categories mc ON c.cid = mc.cid
      WHERE mc.mid = ?
    `, [mid]);
    return results;
  } catch (err) {
    console.error(`Error fetching categories for musician ID ${mid}:`, err);
  }
}

// fetchCategoriesByMusicianId(1)
// .then(results => {
//   console.log(results);
// })
// .catch(error => {
//   console.error(error)
// })

// fetchMusician(100)
// .then(results => {
//   console.log(results);
// })
// .catch(error => {
//   console.error("Error:", error);
// })

// createMusician('test4')
// .then(result => {
//   console.log(result);
// })
// .catch(error => {
//   console.error('Error:', error)
// })

module.exports = {
  fetchMusicians,
  fetchMusician,
  createMusician,
  fetchCategoriesByMusicianId
}





